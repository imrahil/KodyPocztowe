/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.model.vo
{
    [Bindable]
    public class ZipCodeVO
    {
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
