From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Mon, 16 Dec 2013 13:19:47 +0000
Message-ID: <bug-58378-8800-p5ISQpkKuZ@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0437589337=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0437589337==
Content-Type: multipart/alternative; boundary="1387199987.BbF26.26100"; charset="us-ascii"


--1387199987.BbF26.26100
Date: Mon, 16 Dec 2013 13:19:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

Tom Wijsman <TomWij-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|TomWij-EMRzualFZlQ@public.gmane.org             |TomWij-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org

--- Comment #38 from Tom Wijsman <TomWij-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> ---
(In reply to comment #37)
> This also means that you are NOT regularly pulling the updates from Linus'
> central git into the nouveau git, but typically only do this ONCE after
> Linus released a new version (here: 3.4.0)

That usually is done as often as necessary; if one does it more often, it could
lead to situations where you have pulled a new broken commit that could slow
down Nouveau development. And thus, pulling major releases is efficient.

> and then NOT for any minor
> subsequent release by Linus (3.4.1, 3.4.2 and so on)

Note that those releases happen by Greg KH and consist of backported patches.

> but ONLY shortly
> before he opens the "rc" pull window for his next release series (here:
> 3.5-rc1).

That would be one possible moment where the conditions are ideal enough to
pull.

Though I am in doubt whether it matters when this was pulled from Linus. If you
don't like to bisect the Nouveau development branch, you can bisect kernel git.

> Besed on this, I did further testing:
> 
> Both "5e120f6e4b3f35b741c5445dfc755f50128c3c44^" and
> "5e120f6e4b3f35b741c5445dfc755f50128c3c44" do still run fine, i.e. the
> commit 5e120f6e4b3f35b741c5445dfc755f50128c3c44 - which actually introduced
> the nv84_fence - does NOT seem to be causing the distortion issue.
> 
> I will now move forward (slowly, as I need to do the tarball-based rpmbuild
> process), and keep you updated on my findings.

You really want to be doing a git bisect to do the least amount of work; I
don't see what you mean by "move forward" but I really hope that you are
testing the commits in a binary tree style.

You can put the tarball-based process in a script so you only need to run a
single command after moving further in the bisection.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387199987.BbF26.26100
Date: Mon, 16 Dec 2013 13:19:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:TomWij&#64;gentoo.org" title="Tom Wijsman &lt;TomWij&#64;gentoo.org&gt;"> <span class="fn">Tom Wijsman</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>TomWij&#64;live.com
           </td>
           <td>TomWij&#64;gentoo.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:TomWij&#64;gentoo.org" title="Tom Wijsman &lt;TomWij&#64;gentoo.org&gt;"> <span class="fn">Tom Wijsman</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58378#c37">comment #37</a>)
<span class="quote">&gt; This also means that you are NOT regularly pulling the updates from Linus'
&gt; central git into the nouveau git, but typically only do this ONCE after
&gt; Linus released a new version (here: 3.4.0)</span >

That usually is done as often as necessary; if one does it more often, it could
lead to situations where you have pulled a new broken commit that could slow
down Nouveau development. And thus, pulling major releases is efficient.

<span class="quote">&gt; and then NOT for any minor
&gt; subsequent release by Linus (3.4.1, 3.4.2 and so on)</span >

Note that those releases happen by Greg KH and consist of backported patches.

<span class="quote">&gt; but ONLY shortly
&gt; before he opens the &quot;rc&quot; pull window for his next release series (here:
&gt; 3.5-rc1).</span >

That would be one possible moment where the conditions are ideal enough to
pull.

Though I am in doubt whether it matters when this was pulled from Linus. If you
don't like to bisect the Nouveau development branch, you can bisect kernel git.

<span class="quote">&gt; Besed on this, I did further testing:
&gt; 
&gt; Both &quot;5e120f6e4b3f35b741c5445dfc755f50128c3c44^&quot; and
&gt; &quot;5e120f6e4b3f35b741c5445dfc755f50128c3c44&quot; do still run fine, i.e. the
&gt; commit 5e120f6e4b3f35b741c5445dfc755f50128c3c44 - which actually introduced
&gt; the nv84_fence - does NOT seem to be causing the distortion issue.
&gt; 
&gt; I will now move forward (slowly, as I need to do the tarball-based rpmbuild
&gt; process), and keep you updated on my findings.</span >

You really want to be doing a git bisect to do the least amount of work; I
don't see what you mean by &quot;move forward&quot; but I really hope that you are
testing the commits in a binary tree style.

You can put the tarball-based process in a script so you only need to run a
single command after moving further in the bisection.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387199987.BbF26.26100--

--===============0437589337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0437589337==--
