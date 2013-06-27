From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66129] [BISECTED] nouveau,
 nv50: dual display doesn't work in 3.9
Date: Thu, 27 Jun 2013 08:04:38 +0000
Message-ID: <bug-66129-8800-2oKK3fxniS@http.bugs.freedesktop.org/>
References: <bug-66129-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1073946838=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66129-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1073946838==
Content-Type: multipart/alternative; boundary="1372320278.ca66e3.24243"; charset="us-ascii"


--1372320278.ca66e3.24243
Date: Thu, 27 Jun 2013 08:04:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66129

--- Comment #8 from Yves-Alexis <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> ---
Created attachment 81530
  --> https://bugs.freedesktop.org/attachment.cgi?id=81530&action=edit
dmesg with 3.10-rc7 (bad)

(In reply to comment #2)
> Yves-Alexis thanks for the bisection log
> 
> Note that Bug #64904 is about broken logic wrt VGA detection, and as far as
> I can see Display port is not the same as VGA :) (Per Arnold Blaasmo) 
> 
> Before proceeding make sure that you have the patches from the above bug
> (either apply manually or upstream 3.9.7 & 3.10-rc7)

Ok, this comment is about 3.10-rc7.
> 
> Firstly can you try single head, and confirm if nouveau works correctly for
> each monitor plugged into it's respective connector

No. Only the monitor plugged to the first connector is working (actually
there's only one proprietary connector on the card itself, and I have some kind
of adapter with two VGA outputs).
> 
> Secondly please attach the output of dmesg for working and non-working
> setup. vbios might be useful as well [1]

Attached.

> 
> Lastly please be more explicit as to what the issue is
> "Starting 3.9, dual screen doesn't work anymore (screen stays blank or
> doesn't not start at all)"
> 
> * Which screen stays black, is it connected using VGA, 

The monitor plugged to the second connector stays black. Xorg doesn't even
start.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372320278.ca66e3.24243
Date: Thu, 27 Jun 2013 08:04:38 +0000
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
   title="NEEDINFO --- - [BISECTED] nouveau, nv50: dual display doesn't work in 3.9"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66129#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [BISECTED] nouveau, nv50: dual display doesn't work in 3.9"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66129">bug 66129</a>
              from <span class="vcard"><a class="email" href="mailto:corsac&#64;debian.org" title="Yves-Alexis &lt;corsac&#64;debian.org&gt;"> <span class="fn">Yves-Alexis</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=81530" name="attach_81530" title="dmesg with 3.10-rc7 (bad)">attachment 81530</a> <a href="attachment.cgi?id=81530&amp;action=edit" title="dmesg with 3.10-rc7 (bad)">[details]</a></span>
dmesg with 3.10-rc7 (bad)

(In reply to <a href="show_bug.cgi?id=66129#c2">comment #2</a>)
<span class="quote">&gt; Yves-Alexis thanks for the bisection log
&gt; 
&gt; Note that <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="show_bug.cgi?id=64904">Bug #64904</a> is about broken logic wrt VGA detection, and as far as
&gt; I can see Display port is not the same as VGA :) (Per Arnold Blaasmo) 
&gt; 
&gt; Before proceeding make sure that you have the patches from the above bug
&gt; (either apply manually or upstream 3.9.7 &amp; 3.10-rc7)</span >

Ok, this comment is about 3.10-rc7.
<span class="quote">&gt; 
&gt; Firstly can you try single head, and confirm if nouveau works correctly for
&gt; each monitor plugged into it's respective connector</span >

No. Only the monitor plugged to the first connector is working (actually
there's only one proprietary connector on the card itself, and I have some kind
of adapter with two VGA outputs).
<span class="quote">&gt; 
&gt; Secondly please attach the output of dmesg for working and non-working
&gt; setup. vbios might be useful as well [1]</span >

Attached.

<span class="quote">&gt; 
&gt; Lastly please be more explicit as to what the issue is
&gt; &quot;Starting 3.9, dual screen doesn't work anymore (screen stays blank or
&gt; doesn't not start at all)&quot;
&gt; 
&gt; * Which screen stays black, is it connected using VGA, </span >

The monitor plugged to the second connector stays black. Xorg doesn't even
start.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372320278.ca66e3.24243--

--===============1073946838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1073946838==--
