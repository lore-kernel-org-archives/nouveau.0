From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38074] Dual head doesn't work for some combination
 of monitors (second screen still off)
Date: Tue, 20 Dec 2011 12:05:39 +0000
Message-ID: <bug-38074-8800-F3B3hMSTGd@http.bugs.freedesktop.org/>
References: <bug-38074-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38074-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38074

--- Comment #15 from Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-12-20 04:05:39 PST ---
Out of curiosity, do the lower resolution modes work for DVI?

If you do xrandr --verbose, there should be something like this:
  1280x1024 (0x64)  108.0MHz +HSync +VSync *current +preferred
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock   64.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   60.0Hz

The 108.0MHz is the bandwith required, please choose a mode well below 150 MHz,
something like 100-125 MHz.

Also, you have to switch to "Scaling mode: None"

This snippet from xrandr --verbose shows the default to be Full, which means
your monitor will always recieve native mode.

    scaling mode:    Full
        supported: None         Full         Center       Full aspect

xrandr --output NAME --set "scaling mode" "None"

This command should do the trick if you fill in the right output name, but be
sure to check that the setting is indeed changed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
