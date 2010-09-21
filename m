From: Stefan Mathe <mstefan-26n5VD7DAF2Tm46uYYfjYg@public.gmane.org>
Subject: Re: Problems with dual head on NVidia Quadro NVS 295
Date: Tue, 21 Sep 2010 10:43:06 +0300
Message-ID: <4C98620A.4010608@cs.toronto.edu>
References: <4C977BF6.20505@cs.toronto.edu> <1285020549.9989.0.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1285020549.9989.0.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Ben,

Thanks very much for the useful feedback! :)

I tried to look into the BIOS, but there seems to be no way I can tell
it to initialize both monitors. :( Do you happen to know of a way I
could tell it to do so?

If that is not possible, what would the next step be to have dual
desktop on my system? I tried the proprietary nvidia drivers, but they
seemed to be horribly slow in KDE, so I would definitely prefer nouveau
instead.

If there is any way I can help out implement this feature let me know.

Cheers,
Stefan.
> On Mon, 2010-09-20 at 18:21 +0300, Stefan Mathe wrote:
>   
>> Hello,
>>
>> I'm having problems configuring the dual-head display using an NVidia
>> Quadro NVS 295 display card. It uses two identical LCD monitors (model
>> HP LP2475w), connected using DP cables. If I connect one single monitor
>> (either to the DP-1 or to the DP-2 output), the desktop shows up
>> correctly. If I connect both monitors, only the left monitor shows the
>> image, and the desktop is extended as if the second monitor were showing
>> something. But the right monitor remains blank.
>>     
> This is expected.  Nouveau can't fully program a native DP output on its
> own yet, and relies on assistance from the video BIOS.  As such, only
> displays which have previously been initialised by the VBIOS will work.
>
> Ben.
>   
>> I am using OpenSUSE 11.3, with the nouveau drivers included in its
>> kernel (kernel version 2.6.34). The relevant parts of xorg.conf.d are:
>>
>> Section "Device"
>>   Identifier "Default Device"
>>   Option "SWcursor" "true"
>>   Option "monitor-DP-1" "LeftMonitor"
>>   Option "monitor-DP-2" "RightMonitor"
>> EndSection
>>
>> Section "Monitor"
>>   Identifier "LeftMonitor"
>>   Option "PreferredMode" "1920x1200"
>> EndSection
>>
>> Section "Monitor"
>>   Identifier "RightMonitor"
>>   Option     "RightOf" "LeftMonitor"
>>   Option     "PreferredMode" "1920x1200"
>> EndSection
>>
>> Section "Screen"
>>   Identifier "Default Screen"
>>   Device "Default Device"
>>   Monitor "LeftMonitor"
>>   DefaultDepth 24
>>   SubSection "Display"
>>      Depth 24
>>      Virtual 3840 1200
>>   EndSubSection
>> EndSection
>>
>> Section "ServerLayout"
>>   Identifier "Layout0"
>>   Screen 0 "Default Screen" 0 0
>> EndSection
>>
>> Note that I had to set the mouse cursor to software rendering because it
>> was not showing up at all when using hardware rendering (cursor was
>> entirely invisible but the mouse was operational).
>>
>> The output of the "xrandr" command is:
>>
>> Screen 0: minimum 320 x 200, current 3840 x 1200, maximum 8192 x 8192
>> DP-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis)
>> 546mm x 352mm
>>    1920x1200      60.0*+   59.9 
>>    1920x1080      60.0 
>>    1600x1200      60.0 
>>    1680x1050      60.0 
>>    1600x1000      60.0 
>>    1280x1024      75.0 
>>    1280x960       60.0 
>>    1152x864       75.0 
>>    1024x768       75.1     60.0 
>>    832x624        74.6 
>>    800x600        75.0     60.3 
>>    640x480        75.0     60.0 
>>    720x400        70.1 
>> DP-2 connected 1920x1200+1920+0 (normal left inverted right x axis y
>> axis) 546mm x 352mm
>>    1920x1200      60.0*+   59.9 
>>    1600x1200      60.0 
>>    1680x1050      60.0 
>>    1600x1000      60.0 
>>    1280x1024      75.0 
>>    1280x960       60.0 
>>    1152x864       75.0 
>>    1024x768       75.1     60.0 
>>    832x624        74.6 
>>    800x600        75.0     60.3 
>>    640x480        75.0     60.0 
>>    720x400        70.1 
>>
>> I have also attached my Xorg.0.log file.
>>
>> Many thanks in advance for the help,
>> Stefan.
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>     
>
>   
