package com.kaltura.delegates.report
{
	import com.kaltura.vo.KalturaReportGraph;KalturaReportGraph;;

	import com.kaltura.core.KClassFactory;

	import flash.utils.getDefinitionByName;
	import com.kaltura.config.KalturaConfig;
	import com.kaltura.net.KalturaCall;
	import com.kaltura.delegates.WebDelegateBase;
	public class ReportGetGraphsDelegate extends WebDelegateBase
	{
		public function ReportGetGraphsDelegate(call:KalturaCall, config:KalturaConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var arr : Array = new Array();
			for( var i:int=0; i<result.result.children().length() ; i++)
			{
				var cls : Class = getDefinitionByName('com.kaltura.vo.'+ result.result.children()[i].objectType) as Class;
				var obj : * = (new KClassFactory( cls )).newInstanceFromXML( XMLList(result.result.children()[i]) );
				arr.push(obj);
			}
			return arr;
		}

	}
}
