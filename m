From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Thu, 18 Jul 2013 19:19:15 +0000
Message-ID: <bug-67051-8800-jdSWsBLcS2@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1835017268=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1835017268==
Content-Type: multipart/alternative; boundary="1374175155.56Aa416e0.1316"; charset="us-ascii"


--1374175155.56Aa416e0.1316
Date: Thu, 18 Jul 2013 19:19:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #5 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Emil,

I applied the patch.  For reference:

[/linux-3.10.1/drivers/gpu/drm/nouveau/core/engine/disp]$ diff hdminva3.c-orig
hdminva3.c
56a57,60
>         nv_mask(priv, 0x61c5d0 + soff, 0x00070001, 0x00010001); /* SPARE,
>         HW_CTS */
>         nv_mask(priv, 0x61c568 + soff, 0x00010101, 0x00000000); /* ACR_CTRL,
>         ??
> */
>         nv_mask(priv, 0x61c578 + soff, 0x80000000, 0x80000000); /*
>         ACR_0441_ENABLE */
------------------------------------------------------------------------------
No cigar:

aplay -D plughw:1,x test.wav    # x = 3, 7, 8, _9_
NO SOUND

and

cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               0
-------------------------------
COMMENTS
I'm a little skeptical for two reasons:

1.  The patch (date, presentation) implies that everything was hunky-dory
until those guys on 3.10.1 did something.
Not true.  The nouveau HDMI sound has _never_ worked since 3.8.0 (when I
started paying attention.)

2.  I'm far from a kernel-, nouveau-, patch-, etc-. expert but common sense(?)
tells me that a mere three lines of code can't fix this problem which, again
common sense, looks a lot more intractable.  If I can offer an uneducated guess
nouveau should work first on this 'eld#3.0' to see it handling an EDID properly
(like NVIDIA did - see submission) in order to have a chance at competing with
the big boys (Nvidia, Windows) in the HDMI sound arena (although an elementary
and vital requirement/capability at this day and age).

I'm attaching the new dmesg and Xorg log for this patch attempt.

Thank you for your trying to help,
-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374175155.56Aa416e0.1316
Date: Thu, 18 Jul 2013 19:19:15 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Hi Emil,

I applied the patch.  For reference:

[/linux-3.10.1/drivers/gpu/drm/nouveau/core/engine/disp]$ diff hdminva3.c-orig
hdminva3.c
56a57,60
<span class="quote">&gt;         nv_mask(priv, 0x61c5d0 + soff, 0x00070001, 0x00010001); /* SPARE,
&gt;         HW_CTS */
&gt;         nv_mask(priv, 0x61c568 + soff, 0x00010101, 0x00000000); /* ACR_CTRL,
&gt;         ??
&gt; */
&gt;         nv_mask(priv, 0x61c578 + soff, 0x80000000, 0x80000000); /*
&gt;         ACR_0441_ENABLE */</span >
------------------------------------------------------------------------------
No cigar:

aplay -D plughw:1,x test.wav    # x = 3, 7, 8, _9_
NO SOUND

and

cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               0
-------------------------------
COMMENTS
I'm a little skeptical for two reasons:

1.  The patch (date, presentation) implies that everything was hunky-dory
until those guys on 3.10.1 did something.
Not true.  The nouveau HDMI sound has _never_ worked since 3.8.0 (when I
started paying attention.)

2.  I'm far from a kernel-, nouveau-, patch-, etc-. expert but common sense(?)
tells me that a mere three lines of code can't fix this problem which, again
common sense, looks a lot more intractable.  If I can offer an uneducated guess
nouveau should work first on this 'eld#3.0' to see it handling an EDID properly
(like NVIDIA did - see submission) in order to have a chance at competing with
the big boys (Nvidia, Windows) in the HDMI sound arena (although an elementary
and vital requirement/capability at this day and age).

I'm attaching the new dmesg and Xorg log for this patch attempt.

Thank you for your trying to help,
-- Alex</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374175155.56Aa416e0.1316--

--===============1835017268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1835017268==--
