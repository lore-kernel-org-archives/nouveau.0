From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Tue, 02 Dec 2014 14:59:06 +0000
Message-ID: <bug-27501-8800-v4o3MOBsiF@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1798639043=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1798639043==
Content-Type: multipart/alternative; boundary="1417532346.3765A5.709"; charset="UTF-8"


--1417532346.3765A5.709
Date: Tue, 2 Dec 2014 14:59:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #59 from l3iggs <j@greyltc.com> ---
(In reply to Pierre Moreau from comment #58)
> Created attachment 110350 [details] [review]
> [Patch] Fix acceleration on 9400M v4
> 
> This should be the final verson of this patch, thanks to answers given by
> the Nvidia guys.
> 
> Please check that you can use the NVAC with acceleration. If you want to
> start X or power off the NV96 (if you have one), you will either need to
> deactivate acceleration for it (noaccel=0000:02:00.0) or use the trick
> describe by l3iggs **before** loading Nouveau.

Thanks very much for your work on this Pierre (and thanks to your Nvidia
contacts too). With your previous patch, my NVAC was able to start a fully
accelerated gnome session via X, although it was very unstable and was quite
unusable (however, weston seemed to work fine for me with that patch). With
this latest patch, things seem quite stable. I'm writing this from a
google-chrome browser in gnome-shell/X and generally things seem to be working
so far.

~l3iggs

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417532346.3765A5.709
Date: Tue, 2 Dec 2014 14:59:06 +0000
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
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c59">Comment # 59</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:j&#64;greyltc.com" title="l3iggs &lt;j&#64;greyltc.com&gt;"> <span class="fn">l3iggs</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href="show_bug.cgi?id=27501#c58">comment #58</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=110350" name="attach_110350" title="[Patch] Fix acceleration on 9400M v4">attachment 110350</a> <a href="attachment.cgi?id=110350&amp;action=edit" title="[Patch] Fix acceleration on 9400M v4">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=27501&amp;attachment=110350'>[review]</a> [review]
&gt; [Patch] Fix acceleration on 9400M v4
&gt; 
&gt; This should be the final verson of this patch, thanks to answers given by
&gt; the Nvidia guys.
&gt; 
&gt; Please check that you can use the NVAC with acceleration. If you want to
&gt; start X or power off the NV96 (if you have one), you will either need to
&gt; deactivate acceleration for it (noaccel=0000:02:00.0) or use the trick
&gt; describe by l3iggs **before** loading Nouveau.</span >

Thanks very much for your work on this Pierre (and thanks to your Nvidia
contacts too). With your previous patch, my NVAC was able to start a fully
accelerated gnome session via X, although it was very unstable and was quite
unusable (however, weston seemed to work fine for me with that patch). With
this latest patch, things seem quite stable. I'm writing this from a
google-chrome browser in gnome-shell/X and generally things seem to be working
so far.

~l3iggs</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417532346.3765A5.709--

--===============1798639043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1798639043==--
