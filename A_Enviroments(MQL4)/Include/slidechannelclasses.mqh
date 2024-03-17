//=====================================================================
//	Drawing a linear channel determined by three extremum points:
//=====================================================================

//---------------------------------------------------------------------
#property copyright 	"Dima S., 2010 г."
#property link      	"dimascub@mail.com"
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//	Version history:
//---------------------------------------------------------------------
//	16.11.2010г. - V1.00
//	 - First version;
//
//	21.11.2010г. - V1.01
//	 - Changed - the way of determining position of the channel borders
//		 (upper and lower);
//
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//	Connected libraries:
//---------------------------------------------------------------------

#include	<Object.mqh>
#include	<Arrays\List.mqh>
#include	<Indicators\TimeSeries.mqh>
#include	<ChartObjects\ChartObjectsLines.mqh>
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//	Channel borders:
//---------------------------------------------------------------------
class TChannelBorderObject : public CChartObjectTrend
{
//	General parameters of borders:
private:
	bool							is_created;																				// whether the graphical object is created on the  screen
	long 							chart_id;																				// chart window identifier
	int 							window;																					// subwindow identifier

//	Parameters of a border line:
private:
	string						border_name;																			// name of the border line
	color							border_color;																			// color of the border line
	int								border_width;																		//width of the border line
	ENUM_LINE_STYLE		border_style;																				// style of the border line

//	Coordinate of a border:
private:
	datetime					point_left;																					// time for the left point (T1)
	datetime					point_right;																				// time for the right point (T2)
	double						price_left;																				// price for the left point (P1)
	double						price_right;																			// price for the right point (P2)

public:
	void				TChannelBorderObject();													        				// constructor
	void				~TChannelBorderObject();																	   // destructor
	bool				IsCreated();																						// check whether the line is created

// Creating/deleting the line:
public:
	bool				CreateBorder(long _chart_id, int _window, string _name, datetime _t_left, datetime _t_right, double _p_left, double _p_right, color _color, int _width, ENUM_LINE_STYLE _style);
	bool				CreateBorder(long _chart_id, int _window, string _name, datetime _t_left, datetime _t_right, double _p_left, double _p_right);
	bool				CreateBorder(datetime _t_left, datetime _t_right, double _p_left, double _p_right);
	bool				RemoveBorder();																					// remove the line from the chart

//	Set parameters of the line:
public:
	void				SetCommonParams(long _chart_id, int _window, string _name);
	bool				SetBorderParams(color _color, int _width, ENUM_LINE_STYLE _style);
	bool				SetBorderColor(color _color);
	bool				SetBorderWidth(int _width);
	bool				SetBorderStyle(ENUM_LINE_STYLE _style);

//	Get values of the line:
	double			GetPrice(datetime _dt);																	      // get the price value for a specified point on the line
};
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//	Constructor:
//---------------------------------------------------------------------
void	TChannelBorderObject::TChannelBorderObject()
{
	this.is_created = false;
}

//---------------------------------------------------------------------
//	Destructor:
//---------------------------------------------------------------------
void	TChannelBorderObject::~TChannelBorderObject()
{
	if(this.IsCreated() == true)
	{
		this.Delete();
	}
}

//---------------------------------------------------------------------
//	Check whether the border is created on the chart:
//---------------------------------------------------------------------
bool	TChannelBorderObject::IsCreated()
{
	return(this.is_created);
}

//---------------------------------------------------------------------
//	Creating object:
//---------------------------------------------------------------------
bool	TChannelBorderObject::CreateBorder(long _chart_id, int _window, string _name, datetime _t_left, datetime _t_right, double _p_left, double _p_right, color _color, int _width, ENUM_LINE_STYLE _style)
{
//	If the object is already created, finish:
	if(this.is_created == true)
	{
		return(true);
	}

	this.is_created = false;

	this.chart_id = _chart_id;
	this.window = _window;
	this.border_name = _name;
	this.point_left = _t_left;
	this.point_right = _t_right;
	this.price_left = _p_left;
	this.price_right = _p_right;
	this.border_color = _color;
	this.border_width = _width;
	this.border_style = _style;

	bool	result = this.Create(_chart_id, _name, _window, _t_left, _p_left, _t_right, _p_right);
	if(result == true)
	{
		result &= this.Color(_color);
		result &= this.Width(_width);
		result &= this.Style(_style);
		result &= this.RayRight(true);
		this.is_created = result;
	}

	return(this.is_created);
}

//---------------------------------------------------------------------
//	Creating object:
//---------------------------------------------------------------------
bool	TChannelBorderObject::CreateBorder(long _chart_id, int _window, string _name, datetime _t_left, datetime _t_right, double _p_left, double _p_right)
{
//	If the object is already created, finish:
	if(this.is_created == true)
	{
		return(true);
	}

	this.is_created = false;

	this.chart_id = _chart_id;
	this.window = _window;
	this.border_name = _name;
	this.point_left = _t_left;
	this.point_right = _t_right;
	this.price_left = _p_left;
	this.price_right = _p_right;

	bool	result = this.Create(_chart_id, _name, _window, _t_left, _p_left, _t_right, _p_right);
	if(result == true)
	{
		result &= this.Color(this.border_color);
		result &= this.Width(this.border_width);
		result &= this.Style(this.border_style);
		result &= this.RayRight(true);
		this.is_created = result;
	}

	return(this.is_created);
}

//---------------------------------------------------------------------
//	Creating object:
//---------------------------------------------------------------------
bool	TChannelBorderObject::CreateBorder(datetime _t_left, datetime _t_right, double _p_left, double _p_right)
{
//	If the object is already created, finish:
	if(this.is_created == true)
	{
		return(true);
	}

	this.is_created = false;

	this.point_left = _t_left;
	this.point_right = _t_right;
	this.price_left = _p_left;
	this.price_right = _p_right;

	bool	result = this.Create(this.chart_id, this.border_name, this.window, _t_left, _p_left, _t_right, _p_right);
	if(result == true)
	{
		result &= this.Color(this.border_color);
		result &= this.Width(this.border_width);
		result &= this.Style(this.border_style);
		result &= this.RayRight(true);
		this.is_created = result;
	}

	return(this.is_created);
}

//---------------------------------------------------------------------
//	Set general parameters of the line:
//---------------------------------------------------------------------
void	TChannelBorderObject::SetCommonParams(long _chart_id, int _window, string _name)
{
	this.chart_id = _chart_id;
	this.window = _window;
	this.border_name = _name;
}

//---------------------------------------------------------------------
//	Set graphical parameters of the line:
//---------------------------------------------------------------------
bool	TChannelBorderObject::SetBorderParams(color _color, int _width, ENUM_LINE_STYLE _style)
{
	bool	result = true;

	this.border_color = _color;
	this.border_width = _width;
	this.border_style = _style;

//	If the graphical object is already created, change its parameters:
	if(this.is_created == true)
	{
		result &= this.Color(_color);
		result &= this.Width(_width);
		result &= this.Style(_style);
	}

	return(result);
}

//---------------------------------------------------------------------
//	Setting line color:
//---------------------------------------------------------------------
bool	TChannelBorderObject::SetBorderColor(color _color)
{
	bool	result = true;

	this.border_color = _color;

//	If the graphical object is already created, change its parameters:
	if(this.is_created == true)
	{
		result &= this.Color(_color);
	}

	return(result);
}

//---------------------------------------------------------------------
//	Setting line width:
//---------------------------------------------------------------------
bool	TChannelBorderObject::SetBorderWidth(int _width)
{
	bool	result = true;

	this.border_width = _width;

//	If the graphical object is already created, change its parameters:
	if(this.is_created == true)
	{
		result &= this.Width(_width);
	}

	return(result);
}

//---------------------------------------------------------------------
//	Setting line style:
//---------------------------------------------------------------------
bool	TChannelBorderObject::SetBorderStyle(ENUM_LINE_STYLE _style)
{
	bool	result = true;

	this.border_style = _style;

//	If the graphical object is already created, change its parameters:
	if(this.is_created == true)
	{
		result &= this.Style(_style);
	}

	return(result);
}

//---------------------------------------------------------------------
//	Deleting the line from the chart:
//---------------------------------------------------------------------
bool	TChannelBorderObject::RemoveBorder()
{
//	If the graphical object is created, delete it:
	if(this.is_created == true)
	{
		this.is_created = false;
		return(this.Delete());
	}
	return(true);
}

//---------------------------------------------------------------------
//	Getting the price value in a specified point of the border line:
//---------------------------------------------------------------------
double	TChannelBorderObject::GetPrice(datetime _dt)
{
//	If the graphical object is created, we get the price:
	if(this.is_created == true)
	{
		return(ObjectGetValueByTime(this.chart_id, this.border_name, _dt));
	}
	return(0.0);
}
//---------------------------------------------------------------------


//---------------------------------------------------------------------
//	Channel:
//---------------------------------------------------------------------
enum ENUM_BORDER_INDEX
{
	BORDER_DN_INDEX = 0,
	BORDER_MD_INDEX = 1,
	BORDER_UP_INDEX = 2,
	BORDER_DN_ZDN_INDEX = 3,
	BORDER_DN_ZUP_INDEX = 4,
	BORDER_MD_ZDN_INDEX = 5,
	BORDER_MD_ZUP_INDEX = 6,
	BORDER_UP_ZDN_INDEX = 7,
	BORDER_UP_ZUP_INDEX = 8
};
//---------------------------------------------------------------------
enum ENUM_CHANNEL_TYPE
{
	CHANNEL_1MAX_2MIN = 1,
	CHANNEL_2MAX_1MIN = 2
};
//---------------------------------------------------------------------
class TSlideChannelObject : public CList
{
private:
	string						prefix_name;
	long 							chart_id;
	int 							window;

private:
	string						symbol;
	ENUM_TIMEFRAMES		time_frame;

private:
	CiTime*						times;

private:
	datetime					point_left;																					// left point
	datetime					point_middle;																				// middle point
	datetime					point_right;																				// right point
	double						price_left;																				// left point
	double						price_middle;																			// middle point
	double						price_right;																			// right point

private:
	bool							show_middle;																			// displaying of the channel middle line
	bool							show_border_zone;																		// отображать процентную зону вокруг границ канала
	bool							show_middle_zone;																		// displaying the percentage zone around the middle line of the channel
	double						border_zone_percentage;
	double						middle_zone_percentage;

private:
	double						left_prices[ 9 ];																		// Y coordinates of the left points of the lines
	double						right_prices[ 9 ];																	// Y coordinates of the right points of the lines

private:
	bool								channel_calculated;																// channel is calculated
	ENUM_CHANNEL_TYPE		channel_type;																		    	// channel type according to the position of extremums
	double							channel_size;																		// channel size
	double							koeff_A;

protected:
	void				FreeSeries();
	bool				MakeLine(int _index);
	bool				RemoveLine(int _index);
	bool				SetColor(int _index, color _color);
	bool				SetWidth(int _index, int _width);
	bool				SetStyle(int _index, ENUM_LINE_STYLE _style);
	bool				CalcChannel();																						// calculation of coordinates of the channel borders
	bool				DrawChannel();																						// drawing the entire channel with consideration of the settings
	bool				CreateTimeSeries();

public:
	void				TSlideChannelObject();																	   	// constructor
	void				~TSlideChannelObject();																	      // destructor
	bool				CreateChannel(string _prefix, long _chart_id, int _window, string _symbol, ENUM_TIMEFRAMES _tf, datetime _t_left, datetime _t_middle, datetime _t_right, double _p_left, double _p_middle, double _p_right);
	bool				SetExtremums(datetime _t_left, datetime _t_middle, datetime _t_right, double _p_left, double _p_middle, double _p_right);
	double			GetChannelSize();																				   // get the channel size
	double			GetKoeffA();																						// get the coefficient of inclination of the channel
	double			GetUpBorderPrice();														    					// get current price of the upper border of the channel
	double			GetDnBorderPrice();																		   	// get current price of the lower border of the channel
	double			GetMiddleLinePrice();																		   // get current price of the middle line of the channel
	bool				IsChannelCalculated();
public:
	bool				SetBorderWidth(int _width);
	bool				SetMiddleWidth(int _width);

	bool				SetUpBorderColor(color _color);
	bool				SetMiddleColor(color _color);
	bool				SetDnBorderColor(color _color);

	bool				SetBorderStyle(ENUM_LINE_STYLE _style);
	bool				SetMiddleStyle(ENUM_LINE_STYLE _style);

	void				ShowMiddle(bool _show);

	void				ShowBorderZone(bool _show);
	void				ShowMiddleZone(bool _show);

	void				BorderZonePercentage(double _perc);
	void				MiddleZonePercentage(double _perc);
};
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//	Constructor:
//---------------------------------------------------------------------
void	TSlideChannelObject::TSlideChannelObject()
{
	this.channel_calculated = false;
	this.symbol = NULL;
	this.time_frame = 0;
	this.show_middle = true;
	this.show_border_zone = true;
	this.show_middle_zone = true;
	this.border_zone_percentage = 10.0;
	this.middle_zone_percentage = 5.0;

//	Create object for drawing the channel borders (but without displaying them on the screen):
	for(int k = 0; k < 9; k++)
	{
		this.Add(new TChannelBorderObject());
	}
}

//---------------------------------------------------------------------
//	Destructor:
//---------------------------------------------------------------------
void	TSlideChannelObject::~TSlideChannelObject()
{
	this.Clear();
	this.FreeSeries();
}

//---------------------------------------------------------------------
//	Check whether the channel is calculated:
//---------------------------------------------------------------------
bool	TSlideChannelObject::IsChannelCalculated()
{
	return(this.channel_calculated);
}

//---------------------------------------------------------------------
//	Creating the channel and drawing it on the screen:
//---------------------------------------------------------------------
bool	TSlideChannelObject::CreateChannel(string _prefix, long _chart_id, int _window, string _symbol, ENUM_TIMEFRAMES _tf, datetime _t_left, datetime _t_middle, datetime _t_right, double _p_left, double _p_middle, double _p_right)
{
	TChannelBorderObject*		trend;

	this.prefix_name = _prefix;
	this.chart_id = _chart_id;
	this.window = _window;
	this.symbol = _symbol;
	this.time_frame = _tf;
	this.point_left = _t_left;
	this.point_middle = _t_middle;
	this.point_right = _t_right;
	this.price_left = _p_left;
	this.price_middle = _p_middle;
	this.price_right = _p_right;

	this.FreeSeries();

//	Create object for getting access to timeseries:
	if(this.CreateTimeSeries() != true)
	{
		return(false);
	}

//	Calculate coordinates:
	if(this.CalcChannel() == false)
	{
		return(false);
	}

//	Lower border:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_DN_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_DnBorder");
		trend.SetBorderParams(LightPink, 2, STYLE_SOLID);
	}

//	Middle line:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_MiddleLine");
		trend.SetBorderParams(Khaki, 1, STYLE_DOT);
	}

//	Upper border:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_UP_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_UpBorder");
		trend.SetBorderParams(LightGreen, 2, STYLE_SOLID);
	}

//	Lower zone of the lower border:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_DN_ZDN_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_DnBorder-%");
		trend.SetBorderParams(Pink, 1, STYLE_DOT);
	}

//	Upper zone of the lower border:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_DN_ZUP_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_DnBorder+%");
		trend.SetBorderParams(Pink, 1, STYLE_DOT);
	}

//	Lower zone of the middle line:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZDN_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_MiddleLine-%");
		trend.SetBorderParams(DarkKhaki, 1, STYLE_DOT);
	}

//	Upper zone of the middle line:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZUP_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_MiddleLine+%");
		trend.SetBorderParams(DarkKhaki, 1, STYLE_DOT);
	}

//	The lower zone of the upper border zone:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_UP_ZDN_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_UpBorder-%");
		trend.SetBorderParams(PaleGreen, 1, STYLE_DOT);
	}

//	The upper part of the upper border:
	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_UP_ZUP_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		trend.SetCommonParams(_chart_id, _window, _prefix + "_UpBorder+%");
		trend.SetBorderParams(PaleGreen, 1, STYLE_DOT);
	}

	return(DrawChannel());
}

//---------------------------------------------------------------------
//	Drawing the entire channel with consideration of the settings:
//---------------------------------------------------------------------
bool	TSlideChannelObject::DrawChannel()
{
//	Lower border:
	bool	result = this.MakeLine(BORDER_DN_INDEX);

//	Middle line:
	if(this.show_middle == true)
	{
		result &= this.MakeLine(BORDER_MD_INDEX);
	}

//	Upper border:
	result &= this.MakeLine(BORDER_UP_INDEX);

	if(this.show_border_zone == true)
	{
//	Lower zone of the lower border:
		result &= this.MakeLine(BORDER_DN_ZDN_INDEX);

//	Upper zone of the lower border:
		result &= this.MakeLine(BORDER_DN_ZUP_INDEX);

//	The lower zone of the upper border zone:
		result &= this.MakeLine(BORDER_UP_ZDN_INDEX);

//	The upper part of the upper border:
		result &= this.MakeLine(BORDER_UP_ZUP_INDEX);
	}


	if(this.show_middle_zone == true)
	{
//	Lower zone of the middle line:
		result &= this.MakeLine(BORDER_MD_ZDN_INDEX);

//	Upper zone of the middle line:
		result &= this.MakeLine(BORDER_MD_ZUP_INDEX);
	}

	return(result);
}

//---------------------------------------------------------------------
//	Display the line on the screen:
//---------------------------------------------------------------------
bool	TSlideChannelObject::MakeLine(int _index)
{
	TChannelBorderObject*		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(_index));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		if(trend.IsCreated() == false)
		{
			return(trend.CreateBorder(this.point_left, this.point_right, left_prices[ _index ], right_prices[ _index ]));
		}
		else
		{
			bool		result = true;
			result &= trend.SetPoint(0, this.point_left, left_prices[ _index ]);
			result &= trend.SetPoint(1, this.point_right, right_prices[ _index ]);
			return(result);
		}
	}
	else
	{
		return(false);
	}
}

//---------------------------------------------------------------------
//	Setting extremum points of the channel:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetExtremums(datetime _t_left, datetime _t_middle, datetime _t_right, double _p_left, double _p_middle, double _p_right)
{
	this.point_left = _t_left;
	this.point_middle = _t_middle;
	this.point_right = _t_right;
	this.price_left = _p_left;
	this.price_middle = _p_middle;
	this.price_right = _p_right;

//	Create object for getting access to timeseries:
	if(this.CreateTimeSeries() != true)
	{
		return(false);
	}

//	Calculate coordinates:
	if(this.CalcChannel() != true)
	{
		return(false);
	}

	return(DrawChannel());
}

//---------------------------------------------------------------------
//	Calculation of coordinate of the channel lines:
//---------------------------------------------------------------------
bool	TSlideChannelObject::CalcChannel()
{
//	Check the points for correctness (simplest checking):
	if(this.point_left == this.point_right || this.point_left == this.point_middle || this.point_middle == this.point_right)
	{
		return(false);
	}

	int			total_bars = Bars(this.symbol, this.time_frame);				// number of bars in history
	if(total_bars == 0)
	{
		return(false);																			// channel cannot be drawn
	}

//	Get relative shift for the extremum points in bars:
	double	B2 = Bars(this.symbol, this.time_frame, this.point_left, this.point_right);
	double	B3 = Bars(this.symbol, this.time_frame, this.point_left, this.point_middle);

//	Coefficient of the line inclination:
	this.koeff_A = (this.price_right - this.price_left) / B2;

//	The price value of the AB line in the point Т3:
	double	P3_AB = this.price_left + B3 * this.koeff_A;

//Determine the channel type - 2MAX_1MIN or 1MAX_2MIN:
	if(P3_AB > this.price_middle)															// 2MAX_1MIN
	{
		this.channel_type = CHANNEL_2MAX_1MIN;

		this.left_prices[ BORDER_UP_INDEX ] = this.price_left;
		this.right_prices[ BORDER_UP_INDEX ] = this.price_right;
	
		this.left_prices[ BORDER_DN_INDEX ] = this.price_middle - B3 * this.koeff_A;
		this.right_prices[ BORDER_DN_INDEX ] = left_prices[ BORDER_DN_INDEX ] + (this.price_right - this.price_left);
	}
	else if(P3_AB < this.price_middle)													// 1MAX_2MIN
	{
		this.channel_type = CHANNEL_1MAX_2MIN;

		this.left_prices[ BORDER_DN_INDEX ] = this.price_left;
		this.right_prices[ BORDER_DN_INDEX ] = this.price_right;
	
		this.left_prices[ BORDER_UP_INDEX ] = this.price_middle - B3 * this.koeff_A;
		this.right_prices[ BORDER_UP_INDEX ] = left_prices[ BORDER_UP_INDEX ] + (this.price_right - this.price_left);
	}
	else
	{
		return(false);																			// channel cannot be drawn (all extremums are on the same line)
	}

	this.left_prices[ BORDER_MD_INDEX ] = (this.left_prices[ BORDER_DN_INDEX ] + this.left_prices[ BORDER_UP_INDEX ]) / 2.0;
	this.right_prices[ BORDER_MD_INDEX ] = (this.right_prices[ BORDER_DN_INDEX ] + this.right_prices[ BORDER_UP_INDEX ]) / 2.0;

	this.channel_size = this.left_prices[ BORDER_UP_INDEX ] - this.left_prices[ BORDER_DN_INDEX ];

//	Calculate lines of the percentage zones around the channel borders:
	double	percentage_delta = this.channel_size * this.border_zone_percentage / 100.0;
	double	md_percentage_delta = this.channel_size * this.middle_zone_percentage / 100.0;

	
	this.left_prices[ BORDER_DN_ZDN_INDEX ] = this.left_prices[ BORDER_DN_INDEX ] - percentage_delta;
	this.right_prices[ BORDER_DN_ZDN_INDEX ] = this.right_prices[ BORDER_DN_INDEX ] - percentage_delta;

	this.left_prices[ BORDER_DN_ZUP_INDEX ] = this.left_prices[ BORDER_DN_INDEX ] + percentage_delta;
	this.right_prices[ BORDER_DN_ZUP_INDEX ] = this.right_prices[ BORDER_DN_INDEX ] + percentage_delta;

	this.left_prices[ BORDER_MD_ZDN_INDEX ] = this.left_prices[ BORDER_MD_INDEX ] - md_percentage_delta;
	this.right_prices[ BORDER_MD_ZDN_INDEX ] = this.right_prices[ BORDER_MD_INDEX ] - md_percentage_delta;

	this.left_prices[ BORDER_MD_ZUP_INDEX ] = this.left_prices[ BORDER_MD_INDEX ] + md_percentage_delta;
	this.right_prices[ BORDER_MD_ZUP_INDEX ] = this.right_prices[ BORDER_MD_INDEX ] + md_percentage_delta;

	this.left_prices[ BORDER_UP_ZDN_INDEX ] = this.left_prices[ BORDER_UP_INDEX ] - percentage_delta;
	this.right_prices[ BORDER_UP_ZDN_INDEX ] = this.right_prices[ BORDER_UP_INDEX ] - percentage_delta;

	this.left_prices[ BORDER_UP_ZUP_INDEX ] = this.left_prices[ BORDER_UP_INDEX ] + percentage_delta;
	this.right_prices[ BORDER_UP_ZUP_INDEX ] = this.right_prices[ BORDER_UP_INDEX ] + percentage_delta;

	this.channel_calculated = true;

	return(true);
}

//---------------------------------------------------------------------
//	Create object for getting access to timeseries:
//---------------------------------------------------------------------
bool	TSlideChannelObject::CreateTimeSeries()
{
	if(CheckPointer(this.times) == POINTER_INVALID)
	{
		this.times = new CiTime();
		this.times.Create(this.symbol, this.time_frame);
		this.times.Refresh(-1);
	}
	else
	{
		this.times.Refresh(-1);
	}
	return(true);
}

//---------------------------------------------------------------------
//	Deleting the objects for accessing timeseries:
//---------------------------------------------------------------------
void	TSlideChannelObject::FreeSeries()
{
	if(CheckPointer(this.times) == POINTER_DYNAMIC)
	{
		delete(this.times);
	}
}

//---------------------------------------------------------------------
//	Get the channel size:
//---------------------------------------------------------------------
double	TSlideChannelObject::GetChannelSize()
{
	return(this.channel_size);
}

//---------------------------------------------------------------------
//	Get the coefficient of the line inclination:
//---------------------------------------------------------------------
double	TSlideChannelObject::GetKoeffA()
{
	return(this.koeff_A);
}

//---------------------------------------------------------------------
//	Get current price of the upper border of the channel:
//---------------------------------------------------------------------
double	TSlideChannelObject::GetUpBorderPrice()
{
	TChannelBorderObject*	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_UP_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		if(trend.IsCreated() == true)
		{
			return(trend.GetPrice((datetime)(SymbolInfoInteger(this.symbol, SYMBOL_TIME))));
		}
	}
	return(0.0);
}

//---------------------------------------------------------------------
//	Get current price of the lower border of the channel:
//---------------------------------------------------------------------
double	TSlideChannelObject::GetDnBorderPrice()
{
	TChannelBorderObject*	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_DN_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		if(trend.IsCreated() == true)
		{
			return(trend.GetPrice((datetime)(SymbolInfoInteger(this.symbol, SYMBOL_TIME))));
		}
	}
	return(0.0);
}

//---------------------------------------------------------------------
//	Get current price of the middle line of the channel:
//---------------------------------------------------------------------
double	TSlideChannelObject::GetMiddleLinePrice()
{
	TChannelBorderObject*	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_INDEX));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		if(trend.IsCreated() == true)
		{
			return(trend.GetPrice((datetime)(SymbolInfoInteger(this.symbol, SYMBOL_TIME))));
		}
	}
	return(0.0);
}

//---------------------------------------------------------------------
//	Delete ling from the chart:
//---------------------------------------------------------------------
bool	TSlideChannelObject::RemoveLine(int _index)
{
	return(false);
}

//---------------------------------------------------------------------
//	Setting line color:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetColor(int _index, color _color)
{
	TChannelBorderObject*	trend = (TChannelBorderObject*)(this.GetNodeAtIndex(_index));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		if(trend.IsCreated() == true)
		{
			return(trend.Color(_color));
		}
	}
	return(false);
}

//---------------------------------------------------------------------
//	Setting line width:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetWidth(int _index, int _width)
{
	TChannelBorderObject* trend = (TChannelBorderObject*)(this.GetNodeAtIndex(_index));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		if(trend.IsCreated() == true)
		{
			return(trend.Width(_width));
		}
	}
	return(false);
}

//---------------------------------------------------------------------
//	Setting line style:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetStyle(int _index, ENUM_LINE_STYLE _style)
{
	TChannelBorderObject* trend = (TChannelBorderObject*)(this.GetNodeAtIndex(_index));
	if(CheckPointer(trend) != POINTER_INVALID)
	{
		if(trend.IsCreated() == true)
		{
			return(trend.Style(_style));
		}
	}
	return(false);
}

//---------------------------------------------------------------------
//	Set width of the line from drawing the channel borders:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetBorderWidth(int _width)
{
	bool	result = this.SetWidth(BORDER_DN_INDEX, _width);
	result &= this.SetWidth(BORDER_UP_INDEX, _width);
	return(result);
}

//---------------------------------------------------------------------
//	Set width of the line from drawing middle line of the channel:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetMiddleWidth(int _width)
{
	if(this.show_middle == true)
	{
		return(this.SetWidth(BORDER_MD_INDEX, _width));
	}
	return(false);
}

//---------------------------------------------------------------------
//	Set color of the upper border of the channel:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetUpBorderColor(color _color)
{
	bool	result = this.SetColor(BORDER_UP_INDEX, _color);
	if(this.show_border_zone == true)
	{
		result &= this.SetColor(BORDER_UP_ZDN_INDEX, _color);
		result &= this.SetColor(BORDER_UP_ZUP_INDEX, _color);
	}
	return(result);
}

//---------------------------------------------------------------------
//	Set color of the middle line of the channel:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetMiddleColor(color _color)
{
	if(this.show_middle == true)
	{
		bool	result = this.SetColor(BORDER_MD_INDEX, _color);
		if(this.show_middle_zone == true)
		{
			result &= this.SetColor(BORDER_MD_ZDN_INDEX, _color);
			result &= this.SetColor(BORDER_MD_ZUP_INDEX, _color);
		}
		return(result);
	}
	return(false);
}

//---------------------------------------------------------------------
//	Set color of the lower border of the channel:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetDnBorderColor(color _color)
{
	bool	result = this.SetColor(BORDER_DN_INDEX, _color);
	if(this.show_border_zone == true)
	{
		result &= this.SetColor(BORDER_DN_ZDN_INDEX, _color);
		result &= this.SetColor(BORDER_DN_ZUP_INDEX, _color);
	}
	return(result);
}

//---------------------------------------------------------------------
//	Set line style for drawing the channel borders:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetBorderStyle(ENUM_LINE_STYLE _style)
{
	bool	result = this.SetStyle(BORDER_DN_INDEX, _style);
	result &= this.SetStyle(BORDER_UP_INDEX, _style);
	return(result);
}

//---------------------------------------------------------------------
//	Set line style for drawing middle line of the channel:
//---------------------------------------------------------------------
bool	TSlideChannelObject::SetMiddleStyle(ENUM_LINE_STYLE _style)
{
	if(this.show_middle == true)
	{
		return(this.SetStyle(BORDER_MD_INDEX, _style));
	}
	return(false);
}

//---------------------------------------------------------------------
//	Show/Hide the percentage zone around the channel borders:
//---------------------------------------------------------------------
void	TSlideChannelObject::ShowBorderZone(bool _show)
{
	TChannelBorderObject*		trend;

//	If you need to display the lines on the screen:
	if(this.show_border_zone == false && _show == true)
	{
		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_UP_ZDN_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_UpBorder-%");
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_UP_ZUP_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_UpBorder+%");
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_DN_ZDN_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_DnBorder-%");
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_DN_ZUP_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_DnBorder+%");
		}

		this.DrawChannel();
	}
//	If you need to remove the lines from the screen:
	else if(this.show_middle == true && _show == false)
	{
		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_UP_ZDN_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_UP_ZUP_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_DN_ZDN_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_DN_ZUP_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		this.DrawChannel();
	}

	this.show_border_zone = _show;
}

//---------------------------------------------------------------------
//	Show/hide the middle line:
//---------------------------------------------------------------------
void	TSlideChannelObject::ShowMiddle(bool _show)
{
	TChannelBorderObject*		trend;

	if(this.show_middle == false && _show == true)
	{
		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_MiddleLine");
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZDN_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_MiddleLine-%");
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZUP_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_MiddleLine+%");
		}

		this.DrawChannel();
	}
	else if(this.show_middle == true && _show == false)
	{
		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZDN_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZUP_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		this.DrawChannel();
	}

	this.show_middle = _show;
}

//---------------------------------------------------------------------
//	Show/hide the percentage zone around the middle line:
//---------------------------------------------------------------------
void	TSlideChannelObject::ShowMiddleZone(bool _show)
{
	TChannelBorderObject*		trend;

	if(this.show_middle_zone == false && _show == true)
	{
		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZDN_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_MiddleLine-%");
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZUP_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.SetCommonParams(this.chart_id, this.window, this.prefix_name + "_MiddleLine+%");
		}

		this.DrawChannel();
	}
	else if(this.show_middle == true && _show == false)
	{
		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZDN_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		trend = (TChannelBorderObject*)(this.GetNodeAtIndex(BORDER_MD_ZUP_INDEX));
		if(CheckPointer(trend) != POINTER_INVALID)
		{
			trend.Delete();
		}

		this.DrawChannel();
	}

	this.show_middle_zone = _show;
}

//---------------------------------------------------------------------
//	Size of the percentage zone around the channel borders:
//---------------------------------------------------------------------
void	TSlideChannelObject::BorderZonePercentage(double _perc)
{
	this.border_zone_percentage = _perc;
	this.CalcChannel();
	this.DrawChannel();
}

//---------------------------------------------------------------------
//	Size of the percentage zone around the middle line:
//---------------------------------------------------------------------
void	TSlideChannelObject::MiddleZonePercentage(double _perc)
{
	this.middle_zone_percentage = _perc;
	this.CalcChannel();
	this.DrawChannel();
}
//---------------------------------------------------------------------
