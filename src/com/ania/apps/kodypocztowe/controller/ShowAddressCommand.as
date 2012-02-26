/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.controller 
{
    import com.ania.apps.kodypocztowe.services.ISearchService;

    import org.robotlegs.mvcs.SignalCommand;

    public final class ShowAddressCommand extends SignalCommand 
    {
        /** PARAMETERS **/
        [Inject]
        public var zipCode:String;

        /** INJECTIONS **/
        [Inject]
        public var searchService:ISearchService;

        /**
         * Method handle the logic for <code>ShowAddressCommand</code>
         */        
        override public function execute():void    
        {
             searchService.showAddress(zipCode);
        }
    }
}
