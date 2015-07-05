From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91229] [NVA8] VDPAU only works when debug is on
Date: Sun, 05 Jul 2015 20:17:13 +0000
Message-ID: <bug-91229-8800-2oXWqwXAaX@http.bugs.freedesktop.org/>
References: <bug-91229-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0219119303=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91229-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0219119303==
Content-Type: multipart/alternative; boundary="1436127433.1Ed780.4148"; charset="UTF-8"


--1436127433.1Ed780.4148
Date: Sun, 5 Jul 2015 20:17:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91229

--- Comment #4 from zippy <gohabsgo60-FFYn/CNdgSA@public.gmane.org> ---
i don't know if this is useful, but here is the difference in run times for
debug on vs off, for a short mpeg2 video:

off (many dropped frames):
> time mplayer grb_2.mpg
real    0m40.529s
user    0m8.172s
sys     0m2.507s

on:
> time mplayer grb_2.mpg
real    0m32.866s
user    0m1.031s
sys     0m0.374s

i managed to play the full video with debug off without causing the system to
become unresponsive.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436127433.1Ed780.4148
Date: Sun, 5 Jul 2015 20:17:13 +0000
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
   title="NEW - [NVA8] VDPAU only works when debug is on"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91229#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] VDPAU only works when debug is on"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91229">bug 91229</a>
              from <span class="vcard"><a class="email" href="mailto:gohabsgo60&#64;yahoo.ca" title="zippy &lt;gohabsgo60&#64;yahoo.ca&gt;"> <span class="fn">zippy</span></a>
</span></b>
        <pre>i don't know if this is useful, but here is the difference in run times for
debug on vs off, for a short mpeg2 video:

off (many dropped frames):
<span class="quote">&gt; time mplayer grb_2.mpg</span >
real    0m40.529s
user    0m8.172s
sys     0m2.507s

on:
<span class="quote">&gt; time mplayer grb_2.mpg</span >
real    0m32.866s
user    0m1.031s
sys     0m0.374s

i managed to play the full video with debug off without causing the system to
become unresponsive.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436127433.1Ed780.4148--

--===============0219119303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0219119303==--
