From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Fri, 06 May 2016 22:34:41 +0000
Message-ID: <bug-92077-8800-6WgDGIg8GB@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0783589829=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0783589829==
Content-Type: multipart/alternative; boundary="14625740813.B354f5.25434";
 charset="UTF-8"


--14625740813.B354f5.25434
Date: Fri, 6 May 2016 22:34:41 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92077

--- Comment #23 from Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
(In reply to Andrey Mazo from comment #22)
> I'll try to run the applet under apitrace and reproduce the problem.

I finally got an apitrace of Network Monitor applet causing the crash.
I tried to replay it and it's causing the crash within 30 minutes.
I also tried to run 4 replays simultaneously, but it doesn't speed things up --
still about 30 minutes to get to the crash.

The command used to generated the trace:
apitrace trace --api gl plasmawindowed org.kde.plasma.systemmonitor.net

The tarball with the trace, part of dmesg, and other maybe useful info.
https://drive.google.com/open?id=0B19GGUrpQNv3TTNOLXpNUWdnYWM

Please, let me know, if you need any additional information.

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14625740813.B354f5.25434
Date: Fri, 6 May 2016 22:34:41 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">bug 92077</a>
              from <span class="vcard"><a class="email" href="mailto:ahippo&#64;yandex.ru" title="Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <span class="fn">Andrey Mazo</span></a>
</span></b>
        <pre>(In reply to Andrey Mazo from <a href="show_bug.cgi?id=92077#c22">comment #22</a>)
<span class="quote">&gt; I'll try to run the applet under apitrace and reproduce the problem.</span >

I finally got an apitrace of Network Monitor applet causing the crash.
I tried to replay it and it's causing the crash within 30 minutes.
I also tried to run 4 replays simultaneously, but it doesn't speed things up --
still about 30 minutes to get to the crash.

The command used to generated the trace:
apitrace trace --api gl plasmawindowed org.kde.plasma.systemmonitor.net

The tarball with the trace, part of dmesg, and other maybe useful info.
<a href="https://drive.google.com/open?id=0B19GGUrpQNv3TTNOLXpNUWdnYWM">https://drive.google.com/open?id=0B19GGUrpQNv3TTNOLXpNUWdnYWM</a>

Please, let me know, if you need any additional information.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14625740813.B354f5.25434--

--===============0783589829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0783589829==--
