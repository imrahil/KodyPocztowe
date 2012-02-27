package com.ania.apps.kodypocztowe.model.vo
{
    [Bindable]
    public class KodData
    {
        public function KodData()
        {
        }

        public var id:int;
        public var kod:String;
        public var nazwa:String;
        public var miej:String;
        public var woj:String;
        public var adres:String;
        public var powiat:String;
        public var zakres:String;
        public var gmina:String;

    }
}
