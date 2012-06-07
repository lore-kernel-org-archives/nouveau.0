From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49397] Not able to set monitor resolution
Date: Thu, 07 Jun 2012 07:41:08 +0000
Message-ID: <bug-49397-8800-S9p3XgRMMb@http.bugs.freedesktop.org/>
References: <bug-49397-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49397-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=49397

--- Comment #4 from Rob Koll <rob-Mw7XmEnvAQ/z+pZb47iToQ@public.gmane.org> 2012-06-07 00:41:08 PDT ---
I am using Ubuntu 12.4, without a file .xinitrc. The xrandr commands:

xrandr --newmode "1920x1080_60.00" 149.82 1920 1960 2000 2040 1200 1208 1216
1224  +HSync -Vsync
xrandr --addmode DVI-D-1 1920x1080_60.00

have been put in a shell script. This script was added to the startup
application in the system menu (power symbol at right side top, Startup
Applications ...).

Reboot and enjoy the wanted resolution.

I did not find a way to configure the resolution from the xorg.config file,
that seems to me still either an error on my side or a bug. The following
xorg.config seems not to work:

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Philips"
    ModelName      "Brilliance 240S"
    HorizSync       20.0 - 50.0
    VertRefresh     20.0 - 99.0
    Modeline       "1920x1200_60.00" 149.82 1920 1960 2000 2040 1200 1208 1216
1224  +HSync -Vsync
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "DVI"
    Monitor        "Monitor0"
    SubSection     "Display"
        Modes      "1920x1200_60.00"
    EndSubSection
EndSection

Section "Device"
    Identifier "DVI"
    Driver     "nouveau"
EndSection

Kid regards,
Rob Koll

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
