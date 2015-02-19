From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Thu, 19 Feb 2015 09:32:59 +0000
Message-ID: <bug-82714-8800-IL0ranBRBk@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0171782263=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0171782263==
Content-Type: multipart/alternative; boundary="1424338379.A231e42.25862"; charset="UTF-8"


--1424338379.A231e42.25862
Date: Thu, 19 Feb 2015 09:32:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #6 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Sorry, I didn't had much time to look into it...
I'm currently tracking some similar problems on my G96, which is a secondary
GPU. Hopefully, if I manage to solve it, the patch will help you too.

(In reply to Bruno from comment #5)
> After fresh boot:
> echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/reset

Does adding an `echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/rescan` after the
reset changes something?

You hit some PFIFO interrupt 0x00200000... Btw, which kernel version was this
log taken from? Could you please take another log using the reset/rescan trick
with nouveau.debug=debug? The debug argument of Nouveau takes a string (allowed
values are "fatal", "error", "warn", "info", "debug", "trace", "paranoia" and
"spam"), so your 0xff didn't worked.
It's likely that the PFIFO interrupt is unrelated to the "unable to handle
kernel paging request" problem, so you should consider opening a new bug report
for it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424338379.A231e42.25862
Date: Thu, 19 Feb 2015 09:32:59 +0000
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
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Sorry, I didn't had much time to look into it...
I'm currently tracking some similar problems on my G96, which is a secondary
GPU. Hopefully, if I manage to solve it, the patch will help you too.

(In reply to Bruno from <a href="show_bug.cgi?id=82714#c5">comment #5</a>)
<span class="quote">&gt; After fresh boot:
&gt; echo 1 &gt; /sys/bus/pci/devices/0000\:01\:00.0/reset</span >

Does adding an `echo 1 &gt; /sys/bus/pci/devices/0000\:01\:00.0/rescan` after the
reset changes something?

You hit some PFIFO interrupt 0x00200000... Btw, which kernel version was this
log taken from? Could you please take another log using the reset/rescan trick
with nouveau.debug=debug? The debug argument of Nouveau takes a string (allowed
values are &quot;fatal&quot;, &quot;error&quot;, &quot;warn&quot;, &quot;info&quot;, &quot;debug&quot;, &quot;trace&quot;, &quot;paranoia&quot; and
&quot;spam&quot;), so your 0xff didn't worked.
It's likely that the PFIFO interrupt is unrelated to the &quot;unable to handle
kernel paging request&quot; problem, so you should consider opening a new bug report
for it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424338379.A231e42.25862--

--===============0171782263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0171782263==--
