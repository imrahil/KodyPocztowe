/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.signals
{
    import com.ania.apps.kodypocztowe.model.vo.SearchAreaVO;

    import org.osflash.signals.Signal;

    public class SearchZipCodeSignal extends Signal
    {
        public function SearchZipCodeSignal()
        {
            super(SearchAreaVO);
        }
    }
}
