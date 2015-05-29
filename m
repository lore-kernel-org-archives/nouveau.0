From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Fri, 29 May 2015 02:22:02 +0000
Message-ID: <bug-89730-8800-TJPWFc5LWN@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0703404785=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0703404785==
Content-Type: multipart/alternative; boundary="1432866122.FBF31.19028"; charset="UTF-8"


--1432866122.FBF31.19028
Date: Fri, 29 May 2015 02:22:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #32 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to poma from comment #31)
> "Review Request: xtrace - Utility for tracing X11 protocol for debugging"
> https://bugzilla.redhat.com/show_bug.cgi?id=1067665#c18


# yum -q erase xtrace

================================================================================
 Package         Arch            Version               Repository          Size
================================================================================
Removing:
 xtrace          x86_64          1.3.1-7.fc21          installed          297 k

Transaction Summary
================================================================================
Remove  1 Package

Is this ok [y/N]: y
Warning: RPMDB altered outside of yum.


# yum -q reinstall glibc-utils

================================================================================
 Package             Arch           Version               Repository       Size
================================================================================
Reinstalling:
 glibc-utils         x86_64         2.20-8.fc21           updates          28 k

Transaction Summary
================================================================================
Reinstall  1 Package

Is this ok [y/d/N]: y


# yum -q search x11trace
============================ N/S matched: x11trace
=============================
x11trace.x86_64 : A program for X11 protocol tracing

  Name and summary matches only, use "search all" for everything.


# yum -q install x11trace
Package x11trace-1.3.1-8.fc21.x86_64 already installed and latest version


Madre mia

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432866122.FBF31.19028
Date: Fri, 29 May 2015 02:22:02 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>(In reply to poma from <a href="show_bug.cgi?id=89730#c31">comment #31</a>)
<span class="quote">&gt; &quot;Review Request: xtrace - Utility for tracing X11 protocol for debugging&quot;
&gt; <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1067665#c18">https://bugzilla.redhat.com/show_bug.cgi?id=1067665#c18</a></span >


# yum -q erase xtrace

================================================================================
 Package         Arch            Version               Repository          Size
================================================================================
Removing:
 xtrace          x86_64          1.3.1-7.fc21          installed          297 k

Transaction Summary
================================================================================
Remove  1 Package

Is this ok [y/N]: y
Warning: RPMDB altered outside of yum.


# yum -q reinstall glibc-utils

================================================================================
 Package             Arch           Version               Repository       Size
================================================================================
Reinstalling:
 glibc-utils         x86_64         2.20-8.fc21           updates          28 k

Transaction Summary
================================================================================
Reinstall  1 Package

Is this ok [y/d/N]: y


# yum -q search x11trace
============================ N/S matched: x11trace
=============================
x11trace.x86_64 : A program for X11 protocol tracing

  Name and summary matches only, use &quot;search all&quot; for everything.


# yum -q install x11trace
Package x11trace-1.3.1-8.fc21.x86_64 already installed and latest version


Madre mia</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432866122.FBF31.19028--

--===============0703404785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0703404785==--
