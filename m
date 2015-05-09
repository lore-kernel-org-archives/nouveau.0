From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86792] [NVC0] Portal 2 Crashes in Wine
Date: Sat, 09 May 2015 19:22:19 +0000
Message-ID: <bug-86792-8800-FNMyaGeQYP@http.bugs.freedesktop.org/>
References: <bug-86792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1374153116=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1374153116==
Content-Type: multipart/alternative; boundary="1431199339.bA6f27e1.10497"; charset="UTF-8"


--1431199339.bA6f27e1.10497
Date: Sat, 9 May 2015 19:22:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86792

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Anonymous Helper from comment #3)
> Created attachment 115660 [details]
> mesa-10.5.4 and latest wine
> 
> (In reply to Ilia Mirkin from comment #2)
> > While I'm sure you're hitting a real bug in nouveau, I can't debug it with
> > the information provided.
> > 
> > First, what mesa version are you using? Secondly, please arrange to have
> > debug symbols so that the backtrace can have symbols associated with it.
> > 
> > [I'd ignore the suggestion re trying native, I don't see what that has to do
> > with the issue at hand, which is a bug in nouveau triggered by wine.]
> 
> I'm running mesa-10.5.4 from Arch. I modified the PKGBUILD CFLAGS to include
> -DDEBUG settings and also pacman.conf to include debug flags. Still doesn't
> appear to be a useful report. Bug is easily reproducible on the first level
> of portal by looking at the portal from inside the first test chamber.
> Crashes nearly instantly.

OK, I've been able to repro a crash. I now have access to Portal 2, so that
makes it easier for me to debug this. Will update when I get something
useful...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431199339.bA6f27e1.10497
Date: Sat, 9 May 2015 19:22:19 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - [NVC0] Portal 2 Crashes in Wine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86792#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - [NVC0] Portal 2 Crashes in Wine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86792">bug 86792</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Anonymous Helper from <a href="show_bug.cgi?id=86792#c3">comment #3</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=115660" name="attach_115660" title="mesa-10.5.4 and latest wine">attachment 115660</a> <a href="attachment.cgi?id=115660&amp;action=edit" title="mesa-10.5.4 and latest wine">[details]</a></span>
&gt; mesa-10.5.4 and latest wine
&gt; 
&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=86792#c2">comment #2</a>)
&gt; &gt; While I'm sure you're hitting a real bug in nouveau, I can't debug it with
&gt; &gt; the information provided.
&gt; &gt; 
&gt; &gt; First, what mesa version are you using? Secondly, please arrange to have
&gt; &gt; debug symbols so that the backtrace can have symbols associated with it.
&gt; &gt; 
&gt; &gt; [I'd ignore the suggestion re trying native, I don't see what that has to do
&gt; &gt; with the issue at hand, which is a bug in nouveau triggered by wine.]
&gt; 
&gt; I'm running mesa-10.5.4 from Arch. I modified the PKGBUILD CFLAGS to include
&gt; -DDEBUG settings and also pacman.conf to include debug flags. Still doesn't
&gt; appear to be a useful report. Bug is easily reproducible on the first level
&gt; of portal by looking at the portal from inside the first test chamber.
&gt; Crashes nearly instantly.</span >

OK, I've been able to repro a crash. I now have access to Portal 2, so that
makes it easier for me to debug this. Will update when I get something
useful...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431199339.bA6f27e1.10497--

--===============1374153116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1374153116==--
