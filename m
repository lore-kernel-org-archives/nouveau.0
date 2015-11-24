From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92961] Xorg freezes (only mouse and ssh are still
	working)
Date: Tue, 24 Nov 2015 20:45:51 +0000
Message-ID: <bug-92961-8800-nXoFJT1DYu@http.bugs.freedesktop.org/>
References: <bug-92961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1099049269=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1099049269==
Content-Type: multipart/alternative; boundary="1448397951.D18cD1.22102"; charset="UTF-8"


--1448397951.D18cD1.22102
Date: Tue, 24 Nov 2015 20:45:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92961

--- Comment #6 from ruben <nahoo82-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pierre Moreau from comment #2)
> I would start by blacklisting the NVIDIA driver, to prevent it from loading
> while Nouveau is being used as it may results in conflicts. (Just write a
> file named `whichever_name_you_want.conf` in `/etc/modprobe.d/`, and
> containing `blacklist nvidia`.)

The system was already like this, but it still crashes.

> Regarding the second attachment, could you rather please attach Xorg0.log as
> found in `~/.local/share/xorg/`, or `~/.local/xorg/` or `/var/log/`? (From a
> run that froze, and please attach the corresponding dmesg, so that both the
> dmesg and the Xorg.log are from the same run.)

I am seldom at this computer at the moment, but if it crashes again I will do
that. Still the attachements before should provide the same information. Should
they not?

> (In reply to ruben from comment #0)
> > The desktop freezes consistently after a few minutes using the nouveau
> > driver.
> 
> Have you noticed anything that may cause the freeze, like starting a
> browser, running some OpenGL application, or even some fancy compositor
> animation?

No, nothing special. May even happend when I am practically leaving the
computer untouched. In case it helps, I am using GNOME 3.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448397951.D18cD1.22102
Date: Tue, 24 Nov 2015 20:45:51 +0000
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
   title="NEW - Xorg freezes (only mouse and ssh are still working)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92961#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg freezes (only mouse and ssh are still working)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92961">bug 92961</a>
              from <span class="vcard"><a class="email" href="mailto:nahoo82&#64;gmail.com" title="ruben &lt;nahoo82&#64;gmail.com&gt;"> <span class="fn">ruben</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href="show_bug.cgi?id=92961#c2">comment #2</a>)
<span class="quote">&gt; I would start by blacklisting the NVIDIA driver, to prevent it from loading
&gt; while Nouveau is being used as it may results in conflicts. (Just write a
&gt; file named `whichever_name_you_want.conf` in `/etc/modprobe.d/`, and
&gt; containing `blacklist nvidia`.)</span >

The system was already like this, but it still crashes.

<span class="quote">&gt; Regarding the second attachment, could you rather please attach Xorg0.log as
&gt; found in `~/.local/share/xorg/`, or `~/.local/xorg/` or `/var/log/`? (From a
&gt; run that froze, and please attach the corresponding dmesg, so that both the
&gt; dmesg and the Xorg.log are from the same run.)</span >

I am seldom at this computer at the moment, but if it crashes again I will do
that. Still the attachements before should provide the same information. Should
they not?

<span class="quote">&gt; (In reply to ruben from <a href="show_bug.cgi?id=92961#c0">comment #0</a>)
&gt; &gt; The desktop freezes consistently after a few minutes using the nouveau
&gt; &gt; driver.
&gt; 
&gt; Have you noticed anything that may cause the freeze, like starting a
&gt; browser, running some OpenGL application, or even some fancy compositor
&gt; animation?</span >

No, nothing special. May even happend when I am practically leaving the
computer untouched. In case it helps, I am using GNOME 3.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448397951.D18cD1.22102--

--===============1099049269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1099049269==--
