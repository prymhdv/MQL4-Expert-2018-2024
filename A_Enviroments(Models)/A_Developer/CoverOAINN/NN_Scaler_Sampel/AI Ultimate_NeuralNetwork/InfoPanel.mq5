//+------------------------------------------------------------------+
//|                                            		   InfoPanel.mq5 |
//|                                                 Fernando Morales |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Fernando Morales"
#property link      "https://www.mql5.com"
#property version   "1.1"
#property indicator_separate_window
#property indicator_plots 	0
#property indicator_buffers	0
#property indicator_minimum	0.0
#property indicator_maximum	0.0

/***********************************************************************
  Ideas:
	- Option to save a CSV with Spread (Min,Avg,Max), swaps at M1 frequency
	- Show blinking button when the data is being saved
	- Add button to make a chart capture
	- Show the estimated PnL for all trades in the chart
	- Make all chart objects so they are shoed corrected with any screen DPI
	
  Features included in next version 1.1:
  	- Improve the average price calculation ( DONE, 23May2019 )


***********************************************************************/

#include <Trade\SymbolInfo.mqh>
CSymbolInfo simbolo;

#include <Trade\AccountInfo.mqh>
CAccountInfo cuenta;
									// In Europe the expected leverage is 30
sinput int	AccLeverage	= 0;		// Accont leverage (0 - auto)

input string Text_font	= "Lucida Console";			//Generic text font
input int	 Text_size	= 8;						//Generic text size

input bool	inp_useCustomTheme		= false;		//Use custom color theme (define below)
input color	inp_ClrBackground		= C'35,35,35';	//Background
input color	inp_ClrTextoGenerico 	= clrDimGray;	//Generic text
input color	inp_ClrValorPositivo 	= clrLimeGreen;	//Positive value
input color	inp_ClrValorNegativo 	= clrCrimson;	//Negative value
input color	inp_ClrEstado_ON		= clrLimeGreen;	//Status ON
input color	inp_ClrEstado_OFF		= clrDarkBlue;	//Status OFF
input color	inp_ClrSpread			= clrDodgerBlue;//Spread
input color	inp_ClrSpreadMaxMin 	= clrDarkKhaki;	//Spread Max/Min
input color	inp_ClrBarTimer			= clrOrange;	//Bar timer

string	Name = "eKeKo_Dash_";
int 	punto = 1,  X = 10, Y = 10;
double	MarginMinLot  = 0;
bool 	ShowAvgPrice  = true;
bool	ShowSymbolPnL = true;	// to toggle between Symbol/Accont floating profit
bool 	ShowDarkTheme = true;
double 	spread_max, spread_min;

bool 	useCustomTheme;
color	ClrBackground,ClrTextoGenerico, ClrValorPositivo, ClrValorNegativo, ClrEstado_ON, ClrEstado_OFF, ClrSpread, ClrSpreadMaxMin, ClrBarTimer;


int chart_width  = int( ChartGetInteger( 0, CHART_WIDTH_IN_PIXELS  , 1 ));
int chart_height = int( ChartGetInteger( 0, CHART_HEIGHT_IN_PIXELS , 1 ));

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
	simbolo.Name(_Symbol);
	simbolo.Refresh();
	
	EventSetTimer(1); // Activate the OnTimer() with 1 second intervals
	
	if ( _Digits % 2 != 0 ) punto = 10;

	spread_max = GlobalVariableGet( "spread_max_" + _Symbol );
	spread_min = GlobalVariableGet( "spread_min_" + _Symbol );

	ObjectsDeleteAll(0, Name);
	CreateStaticObjects();
	
	UnfrequentData();
	
	
	ChartRedraw();		
//---
   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason) 
{ 
	Comment("");
	
	EventKillTimer();
	
	ObjectsDeleteAll(0, Name);
}

void CreateStaticObjects()
{
	if ( !useCustomTheme )
	
		if ( ShowDarkTheme )
		{
			ClrBackground		= C'35,35,35';
			ClrTextoGenerico 	= clrDimGray;
			ClrValorPositivo 	= clrLimeGreen;
			ClrValorNegativo 	= clrCrimson;
			ClrEstado_ON		= clrLimeGreen;
			ClrEstado_OFF		= clrDimGray;
			ClrSpread			= clrDodgerBlue;
			ClrSpreadMaxMin 	= clrDarkKhaki;
			ClrBarTimer			= clrOrange;
		}
		else
		{
			ClrBackground		= C'190,190,190';
			ClrTextoGenerico 	= clrDimGray;
			ClrValorPositivo 	= clrTeal;
			ClrValorNegativo 	= clrCrimson;
			ClrEstado_ON		= clrDarkGreen;
			ClrEstado_OFF		= clrLightGray;
			ClrSpread			= clrDodgerBlue;
			ClrSpreadMaxMin 	= clrLightSlateGray;
			ClrBarTimer			= clrChocolate;
		}
	else
	{
		ClrBackground		= inp_ClrBackground;
		ClrTextoGenerico 	= inp_ClrTextoGenerico;
		ClrValorPositivo 	= inp_ClrValorPositivo;
		ClrValorNegativo 	= inp_ClrValorNegativo;
		ClrEstado_ON		= inp_ClrEstado_ON;
		ClrEstado_OFF		= inp_ClrEstado_OFF;
		ClrSpread			= inp_ClrSpread;
		ClrSpreadMaxMin 	= inp_ClrSpreadMaxMin;
		ClrBarTimer			= inp_ClrBarTimer;
	}

	//-------------------------------------------------------------------------
	// Background
	//-------------------------------------------------------------------------	
	RectLabelCreate( Name+"Backgrnd", 1,1,chart_width, chart_height, ClrBackground, clrWhite );
	
	// Elementos gráficos se colocan usando referencia la esquina sup izqd
	// La primera coordenada es 10 x 10 pixels ( X , Y )
	// Se establecen varias columnas para distribuir los objetos
	//	Columna 1 en X =  10 px
	//	Columna 2 en X = 170 px
	//	Columna 3 en X = 300 px
	int deltaY = 15;
	
	//-------------------------------------------------------------------------
	// Columna 1  
	//-------------------------------------------------------------------------
	X = 10; 
	Y = 10;
	
	LabelCreate( 			 Name+"NetLots", 		 "0.0", X + (13*7), Y 	);
	LabelCreate( 		Name+"NetLots_text", "   Net Lots:", 	X, Y		);
	ObjectSetInteger(0, Name+"NetLots_text", OBJPROP_COLOR, ClrTextoGenerico);
	
	Y += deltaY;
	LabelCreate( 		Name+"BuyTrades",  " Buy trades:   0", 	X, Y		);
	ObjectSetInteger(0, Name+"BuyTrades", 	 OBJPROP_COLOR, ClrTextoGenerico);
	
	Y += deltaY;
	LabelCreate( 		Name+"SellTrades", "Sell trades:   0", 	X, Y		);
	ObjectSetInteger(0, Name+"SellTrades", 	 OBJPROP_COLOR, ClrTextoGenerico);

	Y += deltaY+15;
	LabelCreate( Name+"SVRTime", "Server Time: ", X, Y );

	Y += deltaY;
	LabelCreate( Name+"GMTTime", "   GMT Time: ", X, Y );

	
	//-------------------------------------------------------------------------
	// Columna 2
	//-------------------------------------------------------------------------
	X = 170;
	Y = 10;
	
	LabelCreate( 		Name+"Spread", 			  "0.0", X+10, Y, ClrSpread	);
	ObjectSetInteger(0, Name+"Spread", OBJPROP_FONTSIZE, 30					);
	ObjectSetString (0, Name+"Spread",	   OBJPROP_FONT, "Corbel"			);
	
	LabelCreate( Name+"SpreadMax",      "0.0", X,   Y, ClrSpreadMaxMin  );

	Y += deltaY;
	LabelCreate( Name+"SpreadMax_text", "Max", X, Y-3, ClrTextoGenerico );
	
	Y += deltaY;
	LabelCreate( Name+"SpreadMin",      "0.0", X,   Y, ClrSpreadMaxMin  );

	Y += deltaY;
	LabelCreate( Name+"SpreadMin_text",	"Min", X, Y-3, ClrTextoGenerico );

	Y += deltaY;
	LabelCreate(		Name+"Timer", "00:00:00", X, Y, ClrBarTimer		);
	ObjectSetInteger(0, Name+"Timer", OBJPROP_FONTSIZE, 20				);

	Y += deltaY;
	LabelCreate( 		Name+"Timer_text", "bar time left", X, Y+10, ClrSpreadMaxMin);
	ObjectSetInteger(0, Name+"Timer_text", OBJPROP_FONTSIZE, Text_size-1);


	//-------------------------------------------------------------------------
	// Columna 3
	//-------------------------------------------------------------------------
	X = 300;
	Y = 10;
	
	
	LabelCreate( Name+"SwapLong_label",  "Swaps", X, Y+(5*7), ClrTextoGenerico );
	ObjectSetDouble(0, Name+"SwapLong_label", OBJPROP_ANGLE, 90	);
	
	X += 2*7;
	Y += deltaY/2;
	LabelCreate( Name+"SwapLong_text",  " Long:", X, Y, ClrTextoGenerico );
	LabelCreate( Name+"SwapLong", 		   "0.0", X+(6*7), Y );
	
	Y += deltaY;	
	LabelCreate( Name+"SwapShort_text", "Short:", X, Y, ClrTextoGenerico );
	LabelCreate( Name+"SwapShort", 		   "0.0", X+(6*7), Y );

	Y += deltaY+5;	
	LabelCreate( Name+"PointValue", "Point Value: 0.0", X, Y );

	Y += deltaY;	
	LabelCreate( Name+"MinLot", StringFormat("Minimum lot size: %g", simbolo.LotsMin() ), X, Y );

	Y += deltaY;	
	LabelCreate( Name+"MarginLot", StringFormat("Margin required 1 lot: %.2f", MarginCalculate( _Symbol, 1) ), X, Y );
	

	
	//-------------------------------------------------------------------------
	// Columna 4
	//-------------------------------------------------------------------------
	X = 480;
	Y = 10;
	
	LabelCreate( 		Name+"Floating PnL", 	"Floating", X, Y+(8*7), ClrTextoGenerico );
	ObjectSetDouble( 0, Name+"Floating PnL", OBJPROP_ANGLE, 90	);
	
	LabelCreate( 		Name+"Symbol switch",	   "Symbol", X+15, Y );
	ObjectSetInteger(0, Name+"Symbol switch", OBJPROP_COLOR, ShowSymbolPnL?ClrEstado_ON:ClrEstado_OFF);
	
	LabelCreate( 		Name+"AccCurr switch", "Account", X+(9*7), Y );
	ObjectSetInteger(0, Name+"AccCurr switch", OBJPROP_COLOR, ShowSymbolPnL?ClrEstado_OFF:ClrEstado_ON);
	
	LabelCreate( Name+"AccCurrency" , cuenta.Currency(), X+15, Y+(7*7), ClrSpreadMaxMin );
	LabelCreate( Name+"PIPs" 		, "PIPs"		   , X+45, Y+(7*7) 					);

	Y += deltaY;		
	LabelCreate( 		Name+"PnL"	,			 "0.0", X, Y						);		
	ObjectSetString( 0, Name+"PnL"	, 	  OBJPROP_FONT, "Arial Rounded MT" 			);
	ObjectSetInteger(0, Name+"PnL"	, OBJPROP_FONTSIZE, 24							);
	ObjectSetString( 0, Name+"PnL"	, 	  OBJPROP_TEXT, StringFormat("  %-+.2f", 0)	);
		

	//-------------------------------------------------------------------------
	// Columna 5
	X = 620;
	Y = 10;
	
	LabelCreate( 	 Name+"PrecioMedio_but", "Show Avg Price", X, Y );
	RectLabelCreate( Name+"PrecioMedio_sign", X+102, Y, 12, 12, ShowAvgPrice?ClrEstado_ON:ClrEstado_OFF);
	HLineCreate( 0.0,Name+"PrecioMedio", clrNONE );
	
	Y += deltaY;
	LabelCreate( 	 Name+"ChangeTheme_but", "Use Dark Theme", X, Y );
	RectLabelCreate( Name+"ChangeTheme_sign", X+102, Y, 12, 12, ShowDarkTheme?ClrEstado_ON:ClrEstado_OFF);
	
	//-------------------------------------------------------------------------
	//Object for showing test data
//	LabelCreate( Name+"Test_text", "Test:", 10,100 );
//	ObjectSetString(0, Name+"Test_text", OBJPROP_TEXT, DoubleToString(price_avg,_Digits));

}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(	const int rates_total, const int prev_calculated, const datetime& time[], 
					const double& open[], const double& high[], const double& low[], 
					const double& close[], const long& tick_volume[], const long& volume[], const int& spreads[])
{	
			ulong ticket=0;
	if ( ShowSymbolPnL )
	{
		if ( PositionsTotal() )
		{
			double lotes_buy=0, lotes_sell=0,precio_medio_buy=0, precio_medio_sell=0, pnl_buy=0, pnl_sell=0;
			double swap_buy=0, swap_sell=0, commi_buy=0, commi_sell=0;
			int trades_buy=0, trades_sell=0;
			
			for ( int i = 0; i <= PositionsTotal(); i++ )
			{
				if ( ( ticket = PositionGetTicket(i)) > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol )
				{
					if ( PositionGetInteger(POSITION_TYPE) == 0 )	// BUY
					{
						trades_buy++;
						lotes_buy 	+= PositionGetDouble( POSITION_VOLUME);
						pnl_buy		+= PositionGetDouble(POSITION_PROFIT);
						swap_buy	+= PositionGetDouble(POSITION_SWAP);
						commi_buy	+= PositionCommission( ticket );
						precio_medio_buy += PositionGetDouble(POSITION_PRICE_OPEN) * PositionGetDouble( POSITION_VOLUME); // Precio ponderado de BUY
					}
					else if ( PositionGetInteger(POSITION_TYPE) == 1 )	// SELL
					{
						trades_sell++;
						lotes_sell 	+= PositionGetDouble( POSITION_VOLUME);
						pnl_sell	+= PositionGetDouble(POSITION_PROFIT);
						swap_sell	+= PositionGetDouble(POSITION_SWAP);
						commi_sell	+= PositionCommission( ticket );
						precio_medio_sell += PositionGetDouble(POSITION_PRICE_OPEN) * PositionGetDouble( POSITION_VOLUME); // Precio ponderado de SELL
					}
				}		
			}

			double lots_net = lotes_buy - lotes_sell;
			double pnl_total = pnl_buy + pnl_sell + swap_buy + swap_sell + commi_buy + commi_sell;
			int trades_total = trades_buy + trades_sell;
			
			ObjectSetInteger( 0, Name +"NetLots", OBJPROP_COLOR, clrWhite ); // En caso de lots_net == 0
			
			if 		( lots_net > 0 ) ObjectSetInteger( 0, Name+"NetLots", OBJPROP_COLOR, ClrValorPositivo );
			else if ( lots_net < 0 ) ObjectSetInteger( 0, Name+"NetLots", OBJPROP_COLOR, ClrValorNegativo );
			
			ObjectSetString( 0, Name +   "NetLots", OBJPROP_TEXT, StringFormat(		     "%+.2f", lots_net	  ));
			ObjectSetString( 0, Name + "BuyTrades", OBJPROP_TEXT, StringFormat(" Buy trades: %d", trades_buy  ));
			ObjectSetString( 0, Name +"SellTrades", OBJPROP_TEXT, StringFormat("Sell trades: %d", trades_sell ));
	
			//---------------------------------------------------------
			// Average Price, idea code from https://www.mql5.com/en/code/12037 
			//---------------------------------------------------------
			if ( ShowAvgPrice && trades_total > 1 )
			{
				if ( lots_net == 0 ) lots_net = 0.00000001;
								
				double price_avg = ( precio_medio_buy - precio_medio_sell ) / lots_net;
								
				price_avg += MathAbs(swap_buy+swap_sell+commi_buy+commi_sell) / lots_net * SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE) * SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
				
				ObjectSetDouble ( 0, Name+"PrecioMedio", OBJPROP_PRICE, NormalizeDouble(price_avg, _Digits) );
				ObjectSetInteger( 0, Name+"PrecioMedio", OBJPROP_COLOR, clrYellow);
			}		
			else
			{
				ObjectSetInteger( 0, Name+"PrecioMedio", OBJPROP_COLOR, clrNONE);	//Hide AvgPrice line
				ObjectSetDouble ( 0, Name+"PrecioMedio", OBJPROP_PRICE, 0);			//Hide AvgPrice line
			}
			
			//---------------------------------------------------------
			// PnL
			//---------------------------------------------------------
			if		( pnl_total > 0 ) ObjectSetInteger( 0, Name+"PnL", OBJPROP_COLOR, ClrValorPositivo);
			else if ( pnl_total < 0 ) ObjectSetInteger( 0, Name+"PnL", OBJPROP_COLOR, ClrValorNegativo);
			
			ObjectSetString( 0, Name+"PnL", OBJPROP_TEXT, StringFormat("  %-+.2f", pnl_total));
			
		}//end if PositionTotal()
		else 
		{
			ObjectSetInteger( 0, Name+"PnL", OBJPROP_COLOR, ClrTextoGenerico );
			ObjectSetString ( 0, Name+"PnL",  OBJPROP_TEXT, StringFormat("  %+.2f", 0 ));
			ObjectSetInteger( 0, Name+"PrecioMedio", OBJPROP_COLOR, clrNONE);	//Hide AvgPrice line
			ObjectSetDouble ( 0, Name+"PrecioMedio", OBJPROP_PRICE, 0);			//Hide AvgPrice line
		}
	}//end ShowSymbolPnL
	
	else 	//Show Account Profit including paid Commission and Swap
	{
		double commi_pos = 0;
		for ( int i = 0; i <= PositionsTotal(); i++ )
			if ( ( ticket = PositionGetTicket(i)) > 0 )
				commi_pos += PositionCommission( ticket );

		double pnl_total = AccountInfoDouble(ACCOUNT_PROFIT) + commi_pos;
		
		if		( pnl_total > 0 ) ObjectSetInteger( 0, Name+"PnL", OBJPROP_COLOR, ClrValorPositivo);
		else if ( pnl_total < 0 ) ObjectSetInteger( 0, Name+"PnL", OBJPROP_COLOR, ClrValorNegativo);
		ObjectSetString( 0, Name+"PnL", OBJPROP_TEXT, StringFormat("  %-+.2f", pnl_total));	
	}	
	
	//-------------------------------------------------------------------------
	// Spread
	//-------------------------------------------------------------------------
	double spread = double( simbolo.Spread() );
	
	if ( spread > spread_max ) 
	{
		spread_max = spread;
		GlobalVariableSet("spread_max_"+_Symbol, spread_max);
	}
	
	if ( spread < spread_min )
	{
		spread_min = spread;
		GlobalVariableSet("spread_min_"+_Symbol, spread_min);
	}
	
	ObjectSetString( 0, Name +    "Spread", OBJPROP_TEXT, StringFormat("   %-0.1f", 	spread /punto ));
	ObjectSetString( 0, Name + "SpreadMax", OBJPROP_TEXT, StringFormat(	    "%.1f", spread_max /punto ));
	ObjectSetString( 0, Name + "SpreadMin", OBJPROP_TEXT, StringFormat(	    "%.1f", spread_min /punto ));
	

	//-------------------------------------------------------------------------
	// Bar Timer, idea code from https://www.mql5.com/en/code/20185 
	//-------------------------------------------------------------------------
	ArraySetAsSeries(time, true);
	
	string	sCurrentTime	= TimeToString ( TimeCurrent(), TIME_SECONDS );
	int		leftTime 		= PeriodSeconds( Period()) - int((TimeCurrent() - time[0]));
	string	sTime			= TimeToString ( leftTime, TIME_SECONDS);
	
	ObjectSetString( 0, Name+"Timer", OBJPROP_TEXT, sTime );
	

//--- return value of prev_calculated for next call
   return(rates_total);
}
  
  
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
{
//---
	simbolo.Refresh();
	
	//-------------------------------------------------------------------------
	// Server and GMT clocks
	ObjectSetString( 0, Name+"SVRTime", OBJPROP_TEXT, "Server Time: "+TimeToString(TimeCurrent(),TIME_SECONDS));
	ObjectSetString( 0, Name+"GMTTime", OBJPROP_TEXT, "   GMT Time: "+TimeToString(TimeGMT(),	 TIME_SECONDS));
	
	if ( EsNuevaVelaH1() ) // Bloque para datos que actualizan muy poco frecuente
	{
		UnfrequentData();
	}
	
	if ( EsNuevaVelaD1() )
	{
		GlobalVariableSet("spread_min_"+_Symbol, GlobalVariableGet("spread_max_"+_Symbol) );
		GlobalVariableSet("spread_max_"+_Symbol, 0);
	}
}   

void UnfrequentData()
{
	// Point Value
	ObjectSetString( 0, Name+"PointValue", OBJPROP_TEXT, StringFormat( "Point Value: %.2f %s", simbolo.TickValue(), cuenta.Currency() ));
		
	// SWAPS
	double swap_long  = simbolo.SwapLong();
	double swap_short = simbolo.SwapShort();

	if 		( swap_long > 0 ) ObjectSetInteger(0, Name+"SwapLong", OBJPROP_COLOR, ClrValorPositivo);
	else if ( swap_long < 0 ) ObjectSetInteger(0, Name+"SwapLong", OBJPROP_COLOR, ClrValorNegativo);

	ObjectSetString( 0, Name+"SwapLong",  OBJPROP_TEXT, StringFormat(" %+.2f", swap_long ));

	if 		( swap_short > 0 ) ObjectSetInteger(0, Name+"SwapShort", OBJPROP_COLOR, ClrValorPositivo);
	else if ( swap_short < 0 ) ObjectSetInteger(0, Name+"SwapShort", OBJPROP_COLOR, ClrValorNegativo);
	
	ObjectSetString( 0, Name+"SwapShort", OBJPROP_TEXT, StringFormat(" %+.2f", swap_short));

}
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent( const int id, const long &lparam, const double &dparam, const string &sparam )
{
//---
	//Print( "ID=",id ,"....Sparam=",sparam, "...Lparam=",lparam, "....Dparam=",dparam );
		
	if ( chart_height != (int)ChartGetInteger( 0, CHART_HEIGHT_IN_PIXELS,1) )
	{
		chart_height = (int)ChartGetInteger( 0, CHART_HEIGHT_IN_PIXELS,1);
		ObjectSetInteger(0, Name+"Backgrnd", OBJPROP_YSIZE,chart_height );
	}
	
	if ( chart_width != (int)ChartGetInteger( 0, CHART_WIDTH_IN_PIXELS,1) )
	{
		chart_width = (int)ChartGetInteger( 0, CHART_WIDTH_IN_PIXELS,1);
		ObjectSetInteger(0, Name+"Backgrnd", OBJPROP_XSIZE,chart_width );
	}
	
	
	// Evaluamos si existe click sobre el texto de PrecioMedio
	if ( sparam == Name+"PrecioMedio_but" || sparam == Name+"PrecioMedio_sign" )
	{
		if ( ShowAvgPrice ) // Click de ON >> OFF
		{
			ShowAvgPrice = false;
			ObjectSetInteger( 0, Name+"PrecioMedio_sign", OBJPROP_BGCOLOR, ClrEstado_OFF);
			ObjectSetDouble(0, Name+"PrecioMedio", OBJPROP_PRICE, 0 );
			//Print("Pasamos a OFF");
		}
		else 	// Click de OFF >> ON
		{
			ShowAvgPrice = true;
			ObjectSetInteger( 0, Name+"PrecioMedio_sign", OBJPROP_BGCOLOR, ClrEstado_ON);
			//Print("Pasamos a ON");
		}	
	}
	else if ( sparam == Name+"ChangeTheme_but" || sparam == Name+"ChangeTheme_sign")
	{
		if ( ShowDarkTheme )	// Click de ON >> OFF
		{
			ShowDarkTheme = false;
			CreateStaticObjects();
			ObjectSetInteger( 0, Name+"ChangeTheme_sign", OBJPROP_BGCOLOR, ClrEstado_OFF );
		}
		else	// Click de OFF >> ON
		{
			ShowDarkTheme = true;
			CreateStaticObjects();
			ObjectSetInteger( 0, Name+"ChangeTheme_sign", OBJPROP_BGCOLOR, ClrEstado_ON );
			ChartRedraw();
		}
	}
	
	if ( sparam == Name+"Symbol switch" || sparam == Name+"AccCurr switch" || sparam == Name+"PnL" )
	{
		if ( ShowSymbolPnL ) // Click de ON >> OFF
		{
			ShowSymbolPnL = false;
			ObjectSetInteger(0,  Name+"Symbol switch", OBJPROP_COLOR, ClrEstado_OFF);
			ObjectSetInteger(0, Name+"AccCurr switch", OBJPROP_COLOR, ClrEstado_ON );

		}
		else
		{
			ShowSymbolPnL = true;
			ObjectSetInteger(0,  Name+"Symbol switch", OBJPROP_COLOR, ClrEstado_ON);
			ObjectSetInteger(0, Name+"AccCurr switch", OBJPROP_COLOR, ClrEstado_OFF );			
		}
	}
	
	ChartRedraw();
	simbolo.Refresh();
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+ 
//| Create a text label                                              | 
//+------------------------------------------------------------------+ 
bool LabelCreate(	string					name,             		  // label name 
					string					text,					  // text 
					int						x=0,                      // X coordinate 
					int						y=0,                      // Y coordinate 					
					const color             clr=clrDimGray,           // color 
					const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring 
					const long              chart_ID=0,               // chart's ID 
					const int               sub_window=1,             // subwindow index 
					const double            angle=0.0,                // text slope 
					const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type 
					const bool              back=false,               // in the background 
					const bool              selection=false,          // highlight to move 
					const bool              hidden=true,              // hidden in the object list 
					const long              z_order=0)                // priority for mouse click 
{ 
//--- reset the error value 
   ResetLastError(); 
//--- create a text label 
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0)) 
     { 
      Print(__FUNCTION__, 
            ": failed to create text label! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- set label coordinates 
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y); 
//--- set the chart's corner, relative to which point coordinates are defined 
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner); 
//--- set the text 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text); 
//--- set text font 
   ObjectSetString(chart_ID,name,OBJPROP_FONT,Text_font); 
//--- set font size 
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,Text_size); 
//--- set the slope angle of the text 
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle); 
//--- set anchor type 
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor); 
//--- set color 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- display in the foreground (false) or background (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- enable (true) or disable (false) the mode of moving the label by mouse 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- hide (true) or display (false) graphical object name in the object list 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- set the priority for receiving the event of a mouse click in the chart 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- successful execution 
   return(true); 
} 


//+------------------------------------------------------------------+ 
//| Create the horizontal line                                       | 
//+------------------------------------------------------------------+ 
bool HLineCreate(	double                price=0,           // line price
					const string          name="HLine",      // line name 
					const color           clr=clrDimGray, 	 // line color 
					const int             width=1,           // line width 
					const ENUM_LINE_STYLE style=STYLE_SOLID, // line style 
					const long            chart_ID=0,        // chart's ID 
					const int             sub_window=0,      // subwindow index 
					const bool            back=false,        // in the background 
					const bool            selection=false,   // highlight to move 
					const bool            hidden=false,      // hidden in the object list 
					const long            z_order=0)         // priority for mouse click 
{ 
//--- if the price is not set, set it at the current Bid price level 
   if(!price) 
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID); 
//--- reset the error value 
   ResetLastError(); 
//--- create a horizontal line 
   if(!ObjectCreate(chart_ID,name,OBJ_HLINE,sub_window,0,price)) 
     { 
      Print(__FUNCTION__, 
            ": failed to create a horizontal line! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- set line color 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- set line display style 
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style); 
//--- set line width 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width); 
//--- display in the foreground (false) or background (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- enable (true) or disable (false) the mode of moving the line by mouse 
//--- when creating a graphical object using ObjectCreate function, the object cannot be 
//--- highlighted and moved by default. Inside this method, selection parameter 
//--- is true by default making it possible to highlight and move the object 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- hide (true) or display (false) graphical object name in the object list 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- set the priority for receiving the event of a mouse click in the chart 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- successful execution 
   return(true); 
} 


//+------------------------------------------------------------------+ 
//| Create rectangle label                                           | 
//+------------------------------------------------------------------+ 
bool RectLabelCreate(	const string           name="RectLabel",         // label name 
						const int              x=0,                      // X coordinate 
						const int              y=0,                      // Y coordinate 
						const int              width=50,                 // width 
						const int              height=18,                // height 
						const color            back_clr=clrDimGray,		 // background color 
						const color            clr=clrNONE,				 // flat border color (Flat) 
						const ENUM_BORDER_TYPE border=BORDER_FLAT,       // border type 
						const ENUM_LINE_STYLE  style=STYLE_SOLID,        // flat border style
						const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring 
						const long             chart_ID=0,               // chart's ID 
						const int              sub_window=1,             // subwindow index 
						const int              line_width=1,             // flat border width 
						const bool             back=false,               // in the background 
						const bool             selection=false,          // highlight to move 
						const bool             hidden=true,              // hidden in the object list 
						const long             z_order=0)                // priority for mouse click 
  { 
//--- reset the error value 
   ResetLastError(); 
//--- create a rectangle label 
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0)) 
     { 
      Print(__FUNCTION__, 
            ": failed to create a rectangle label! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- set label coordinates 
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y); 
//--- set label size 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height); 
//--- set background color 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr); 
//--- set border type 
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border); 
//--- set the chart's corner, relative to which point coordinates are defined 
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner); 
//--- set flat border color (in Flat mode) 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- set flat border line style 
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style); 
//--- set flat border width 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width); 
//--- display in the foreground (false) or background (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- enable (true) or disable (false) the mode of moving the label by mouse 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- hide (true) or display (false) graphical object name in the object list 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- set the priority for receiving the event of a mouse click in the chart 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- successful execution 
   return(true); 
} 

enum ENUM_TIEMPO { TIEMPO_FECHA, TIEMPO_DIA, TIEMPO_MES, TIEMPO_AÑO, TIEMPO_HORA, TIEMPO_MINUTOS, TIEMPO_SEGUNDOS, TIEMPO_TIEMPO, TIEMPO_DETALLE };

string DameTiempos( int _tipoDato, datetime _fecha=0 )
{
	if ( _fecha == 0 ) _fecha = TimeCurrent();

	MqlDateTime fecha;
	TimeToStruct( _fecha, fecha );

	switch ( _tipoDato )
	{
		case TIEMPO_FECHA	: return( StringFormat("%04d-%02d-%02d", fecha.year, fecha.mon, fecha.day ));
		case TIEMPO_TIEMPO	: return( StringFormat("%02dh%02dh%02d", Hour(), Minute(), Seconds()));
		case TIEMPO_DETALLE : return( StringFormat("%04d-%02d-%02d %02dh%02dm%02d", fecha.year, fecha.mon, fecha.day, Hour(), Minute(), Seconds()));
		case TIEMPO_DIA		: return( StringFormat("%02d", fecha.day ));
		case TIEMPO_MES		: return( StringFormat("%02d", fecha.mon ));
		case TIEMPO_AÑO		: return( StringFormat("%04d", fecha.year));
		case TIEMPO_HORA	: return( StringFormat("%02d", fecha.hour));
		case TIEMPO_MINUTOS	: return( StringFormat("%02d", fecha.min ));
		case TIEMPO_SEGUNDOS: return( StringFormat("%02d", fecha.sec ));
	}
	
	return("Error");
}

ushort Year()	{	return( ushort(DameTiempos(TIEMPO_AÑO)));	  }
ushort Month()	{	return( ushort(DameTiempos(TIEMPO_MES)));	  }
ushort Day()	{	return( ushort(DameTiempos(TIEMPO_DIA)));	  }
ushort Hour()	{	return( ushort(DameTiempos(TIEMPO_HORA)));	  }
ushort Minute()	{	return( ushort(DameTiempos(TIEMPO_MINUTOS))); }
ushort Seconds(){	return( ushort(DameTiempos(TIEMPO_SEGUNDOS)));}

// Determina si ha llegado una nueva vela
bool EsNuevaVelaH1() 
{
	static datetime momentoInicial = iTime(NULL, PERIOD_H1, 0);
	
	if ( momentoInicial == iTime(NULL, PERIOD_H1, 0) ) 
	{			
		return(false);
	}
	else 
	{			
		momentoInicial = iTime(NULL, PERIOD_H1, 0);
		return(true);
	}
	
	return(false);
}

// Determina si ha llegado una nueva vela
bool EsNuevaVelaD1() 
{
	static datetime momentoInicial = iTime(NULL, PERIOD_D1, 0);
	
	if ( momentoInicial == iTime(NULL, PERIOD_D1, 0) ) 
	{			
		return(false);
	}
	else 
	{			
		momentoInicial = iTime(NULL, PERIOD_D1, 0);
		return(true);
	}
	
	return(false);
}

double MarginCalculate(string _symbol, double _volume)
{
	string first    = SymbolInfoString( _symbol, SYMBOL_CURRENCY_MARGIN ); // the first/base currency, for example,  EUR in EURUSD
	string second   = SymbolInfoString( _symbol, SYMBOL_CURRENCY_PROFIT ); // the second symbol, for example, USD
	string currency = AccountInfoString(ACCOUNT_CURRENCY);        // deposit currency, for example,  USD
	long   leverage = AccountInfoInteger(ACCOUNT_LEVERAGE);        // leverage, for example,          100
	
	if ( AccLeverage > 0 ) leverage = AccLeverage;
	
	// contract size, for example, 100000
	double contract = SymbolInfoDouble( _symbol, SYMBOL_TRADE_CONTRACT_SIZE);
	double bid      = SymbolInfoDouble( _symbol, SYMBOL_BID);      // Bid price

	//if ( _volume < contract ) _volume = SymbolInfoDouble( _symbol, SYMBOL_VOLUME_MIN );

	//---- allow only standard forex symbols like XXXYYY
	if(StringLen(_symbol) != 6)
	{
		Print("MarginCalculate: '",_symbol,"' must be standard forex symbol XXXYYY");
		//return(0.0);
	}

	//---- check for data availability
	if(bid <= 0 || contract <= 0) 
	{
		Print("MarginCalculate: no market information for '",_symbol,"'");
		return(0.0);
	}

//---- check the simplest variations - without cross currencies
   if(first == currency) return(contract*_volume / leverage);           // USDxxx
   
   if(second == currency) return(contract*bid*_volume / leverage);       // xxxUSD

//---- check normal cross currencies, search for direct conversion through deposit currency
   string base = currency + first;	// USDxxx
   
   if( SymbolInfoDouble( base, SYMBOL_TRADE_CONTRACT_SIZE) > 0) 
       return(contract / SymbolInfoDouble( base, SYMBOL_BID) *_volume / leverage);

//---- try vice versa
   base = first + currency;	// xxxUSD
   
   if( SymbolInfoDouble( base, SYMBOL_TRADE_CONTRACT_SIZE)  > 0) 
       return( contract * SymbolInfoDouble( base, SYMBOL_BID) *_volume / leverage);

//---- direct conversion is impossible
   Print("MarginCalculate: can not convert '",_symbol,"'");
   return(0.0);
}

double PositionCommission( ulong _PosID )
{
	if ( HistorySelectByPosition( _PosID ) )
	{
		double commission = 0;
		
		for( int j = HistoryDealsTotal(); j >= 0 ; j-- )
		{
			// Get the DEAl ticket for this round
			ulong deal_ticket = HistoryDealGetTicket( j );
			
			// If there is no ticket we move to next iteration
			if ( deal_ticket == 0 ) continue;

			commission	+= HistoryDealGetDouble (deal_ticket, DEAL_COMMISSION);
		}
		
		return( commission );
	}

	return( 0 );
}