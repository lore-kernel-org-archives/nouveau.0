From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] DVI monitor connected via HDMI is
 blank / standby (NV96 / 9500GS)
Date: Sun, 25 Aug 2013 05:40:32 +0000
Message-ID: <bug-43939-8800-ZenRaZFBoX@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0971182868=="
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


--===============0971182868==
Content-Type: multipart/alternative; boundary="1377409232.AACdA2.7972"; charset="us-ascii"


--1377409232.AACdA2.7972
Date: Sun, 25 Aug 2013 05:40:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

--- Comment #11 from Anthony Foiani <anthony.foiani+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #10)
> With a bit of luck, this is similar to bug #60680, which will hopefully be
> bisected soon.

Hopefully!

> By the way, are you connecting to your monitor's HDMI input, or is there a
> HDMI->DVI adapter in there?

All the failures are with HDMI-to-DVI adapters of various sorts.  (Originally
it was a HDMI-to-DVI cable; I seem to have misplaced that cable, so at the
moment I'm using HDMI-to-HDMI + adapter + DVI-to-KVM + KVM-to-DVI ...

Which is a mess, but since the BIOS / UEFI and grub all seem to work with it,
it still looks like xorg / nouveau is doing something odd.

Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377409232.AACdA2.7972
Date: Sun, 25 Aug 2013 05:40:32 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:anthony.foiani+freedesktop&#64;gmail.com" title="Anthony Foiani &lt;anthony.foiani+freedesktop&#64;gmail.com&gt;"> <span class="fn">Anthony Foiani</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=43939#c10">comment #10</a>)
<span class="quote">&gt; With a bit of luck, this is similar to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="show_bug.cgi?id=60680">bug #60680</a>, which will hopefully be
&gt; bisected soon.</span >

Hopefully!

<span class="quote">&gt; By the way, are you connecting to your monitor's HDMI input, or is there a
&gt; HDMI-&gt;DVI adapter in there?</span >

All the failures are with HDMI-to-DVI adapters of various sorts.  (Originally
it was a HDMI-to-DVI cable; I seem to have misplaced that cable, so at the
moment I'm using HDMI-to-HDMI + adapter + DVI-to-KVM + KVM-to-DVI ...

Which is a mess, but since the BIOS / UEFI and grub all seem to work with it,
it still looks like xorg / nouveau is doing something odd.

Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377409232.AACdA2.7972--

--===============0971182868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0971182868==--
