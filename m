From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Tue, 29 Apr 2014 20:20:22 +0000
Message-ID: <bug-78092-8800-vpReS1xwpm@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0444855827=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0444855827==
Content-Type: multipart/alternative; boundary="1398802822.4Dc3Ad081.15489"; charset="us-ascii"


--1398802822.4Dc3Ad081.15489
Date: Tue, 29 Apr 2014 20:20:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #4)
> Created attachment 98193 [details]
> dmesg after 1st patch
> 
> I need to wait until my distro (gentoo) makes 3.15 available. 
> meanwhile I applied the 1st patch to my current 3.14 kernel.
> 
> It did find some BIOS, but some errors appeared. The bumblebee still fails
> to run glxinfo.
> 
> dmesg is attached if you are interested.

Perhaps I was unclear in the steps I outlined. I _did_ think I was fairly
explicit in "don't use bumblebee", but perhaps not enough. So let me be crystal
clear:

DO NOT USE BUMBLEBEE.

Also, you don't have to wait for your distribution to make a kernel available.
(Unless you're using genkernel or something crazy like that... but even that
should be able to build an arbitrary tree, I thought.) You can get releases
from http://www.kernel.org/ and/or you can create your own git clone.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398802822.4Dc3Ad081.15489
Date: Tue, 29 Apr 2014 20:20:22 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78092#c4">comment #4</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=98193" name="attach_98193" title="dmesg after 1st patch">attachment 98193</a> <a href="attachment.cgi?id=98193&amp;action=edit" title="dmesg after 1st patch">[details]</a></span>
&gt; dmesg after 1st patch
&gt; 
&gt; I need to wait until my distro (gentoo) makes 3.15 available. 
&gt; meanwhile I applied the 1st patch to my current 3.14 kernel.
&gt; 
&gt; It did find some BIOS, but some errors appeared. The bumblebee still fails
&gt; to run glxinfo.
&gt; 
&gt; dmesg is attached if you are interested.</span >

Perhaps I was unclear in the steps I outlined. I _did_ think I was fairly
explicit in &quot;don't use bumblebee&quot;, but perhaps not enough. So let me be crystal
clear:

DO NOT USE BUMBLEBEE.

Also, you don't have to wait for your distribution to make a kernel available.
(Unless you're using genkernel or something crazy like that... but even that
should be able to build an arbitrary tree, I thought.) You can get releases
from <a href="http://www.kernel.org/">http://www.kernel.org/</a> and/or you can create your own git clone.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398802822.4Dc3Ad081.15489--

--===============0444855827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0444855827==--
