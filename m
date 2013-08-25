From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] DVI monitor connected via HDMI is
 blank / standby (NV96 / 9500GS)
Date: Sun, 25 Aug 2013 04:21:29 +0000
Message-ID: <bug-43939-8800-vJ8mJiARDq@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0591091455=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0591091455==
Content-Type: multipart/alternative; boundary="1377404489.4cebb2.27802"; charset="us-ascii"


--1377404489.4cebb2.27802
Date: Sun, 25 Aug 2013 04:21:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

--- Comment #8 from Anthony Foiani <anthony.foiani+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #7)
> Would you mind trying 3.11-rc6, or apply
> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/
> ?id=9a7046d55f319b2dde5d2536cc2adb01ebdbe09e to your kernel? I'm not 100%
> sure it'll fix things, but it's definitely worth a shot. I can't quite tell
> if your DCB types would have gotten messed up by this test or not.

Well, I tried to... but some combination of UEFI and/or Fedora weirdness is
keeping me from booting all the way into 3.11-rc6.

I'm downloading the rawhide (f20branch) live media right now, will see if I can
boot all the way with it.

On the plus side, I did see an error screen with graphical tuxes, and the error
was some 2s into the boot.  So it's possible that things are working on the
nouveau side, and it's just getting confused by Fedora.

Ok, live media downloaded, time for a reboot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377404489.4cebb2.27802
Date: Sun, 25 Aug 2013 04:21:29 +0000
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
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:anthony.foiani+freedesktop&#64;gmail.com" title="Anthony Foiani &lt;anthony.foiani+freedesktop&#64;gmail.com&gt;"> <span class="fn">Anthony Foiani</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=43939#c7">comment #7</a>)
<span class="quote">&gt; Would you mind trying 3.11-rc6, or apply
&gt; <a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/</a>
&gt; ?id=9a7046d55f319b2dde5d2536cc2adb01ebdbe09e to your kernel? I'm not 100%
&gt; sure it'll fix things, but it's definitely worth a shot. I can't quite tell
&gt; if your DCB types would have gotten messed up by this test or not.</span >

Well, I tried to... but some combination of UEFI and/or Fedora weirdness is
keeping me from booting all the way into 3.11-rc6.

I'm downloading the rawhide (f20branch) live media right now, will see if I can
boot all the way with it.

On the plus side, I did see an error screen with graphical tuxes, and the error
was some 2s into the boot.  So it's possible that things are working on the
nouveau side, and it's just getting confused by Fedora.

Ok, live media downloaded, time for a reboot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377404489.4cebb2.27802--

--===============0591091455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0591091455==--
