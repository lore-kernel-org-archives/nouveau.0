From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93405] nouveau: Xorg crashes sooner or later in
	3840x2160 mode
Date: Thu, 07 Jan 2016 20:23:00 +0000
Message-ID: <bug-93405-8800-78WHu9SPbn@http.bugs.freedesktop.org/>
References: <bug-93405-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1768966300=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93405-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1768966300==
Content-Type: multipart/alternative; boundary="1452198179.Bf8cdAF1.2746"; charset="UTF-8"


--1452198179.Bf8cdAF1.2746
Date: Thu, 7 Jan 2016 20:22:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93405

--- Comment #10 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Good news: I can now set various 3840x2160 modes without making nouveau halt or
crash (It may still hang after a heavy reconfiguration session though). The
only drawback about it is that my displays (AOC u2868pqu, Samsung flat-tv) will
stay dark (3840x2160 non-interlaced) or in a fact show a 2560x1600 mode when I
try to set a 3840x2160 interlaced mode (the monitor does not claim to support
interlaced modes by its EDID though). Tested with various modelines as well as
the modeline suggested by my xorg.conf. Would anyone have a look whether it
should be possible to achieve 3840x2160 with this hardware configuration
(Xorg.0.log is available; decoded edid will come shortly.)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1452198179.Bf8cdAF1.2746
Date: Thu, 7 Jan 2016 20:22:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405">bug 93405</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Good news: I can now set various 3840x2160 modes without making nouveau halt or
crash (It may still hang after a heavy reconfiguration session though). The
only drawback about it is that my displays (AOC u2868pqu, Samsung flat-tv) will
stay dark (3840x2160 non-interlaced) or in a fact show a 2560x1600 mode when I
try to set a 3840x2160 interlaced mode (the monitor does not claim to support
interlaced modes by its EDID though). Tested with various modelines as well as
the modeline suggested by my xorg.conf. Would anyone have a look whether it
should be possible to achieve 3840x2160 with this hardware configuration
(Xorg.0.log is available; decoded edid will come shortly.)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452198179.Bf8cdAF1.2746--

--===============1768966300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1768966300==--
