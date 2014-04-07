From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77102] gallium nouveau has no profile in vdpau and
	libva
Date: Mon, 07 Apr 2014 07:09:20 +0000
Message-ID: <bug-77102-8800-BG7t2rre4V@http.bugs.freedesktop.org/>
References: <bug-77102-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0866143531=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77102-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0866143531==
Content-Type: multipart/alternative; boundary="1396854560.dEAEFA0.16559"; charset="us-ascii"


--1396854560.dEAEFA0.16559
Date: Mon, 7 Apr 2014 07:09:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77102

--- Comment #14 from Stefan Ringel <mail-Omqj8X2OoDOCVLKmEEjRFg@public.gmane.org> ---
(In reply to comment #13)
> Created attachment 97009 [details] [review]
> firmware present patch
> 
> OK, upon further code reading, it looks like the way nouveau does class id's
> is a bit off. That doesn't strictly matter for BSP, but there's a mismatch
> in the logic between mesa and the kernel, which causes problems for NVD7 and
> NVD9 cards.
> 
> In nouveau_vp3_video.c:firmware_present,
> 
>       if (chipset < 0xc0)
>          oclass = 0x85b1;
>       else if (vp5)
>          oclass = 0x95b1;
>       else
>          oclass = 0x90b1;
> 
> should become
> 
>       if (chipset < 0xc0)
>          oclass = 0x85b1;
>       else if (chipset < 0xe0)
>          oclass = 0x90b1;
>       else
>          oclass = 0x95b1;
> 
> Since the kernel expects the 90b1 class to be used on the NVD9 card, despite
> it having VP5. I've attached this change as a patch, please try it out. (If
> you can't, I'll try to locate someone else with the relevant hardware, but
> it'd be much easier if you could do it.)

Patch works. Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396854560.dEAEFA0.16559
Date: Mon, 7 Apr 2014 07:09:20 +0000
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
   title="REOPENED --- - gallium nouveau has no profile in vdpau and libva"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77102#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - gallium nouveau has no profile in vdpau and libva"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77102">bug 77102</a>
              from <span class="vcard"><a class="email" href="mailto:mail&#64;stefanringel.de" title="Stefan Ringel &lt;mail&#64;stefanringel.de&gt;"> <span class="fn">Stefan Ringel</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77102#c13">comment #13</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=97009" name="attach_97009" title="firmware present patch">attachment 97009</a> <a href="attachment.cgi?id=97009&amp;action=edit" title="firmware present patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=77102&amp;attachment=97009'>[review]</a> [review]
&gt; firmware present patch
&gt; 
&gt; OK, upon further code reading, it looks like the way nouveau does class id's
&gt; is a bit off. That doesn't strictly matter for BSP, but there's a mismatch
&gt; in the logic between mesa and the kernel, which causes problems for NVD7 and
&gt; NVD9 cards.
&gt; 
&gt; In nouveau_vp3_video.c:firmware_present,
&gt; 
&gt;       if (chipset &lt; 0xc0)
&gt;          oclass = 0x85b1;
&gt;       else if (vp5)
&gt;          oclass = 0x95b1;
&gt;       else
&gt;          oclass = 0x90b1;
&gt; 
&gt; should become
&gt; 
&gt;       if (chipset &lt; 0xc0)
&gt;          oclass = 0x85b1;
&gt;       else if (chipset &lt; 0xe0)
&gt;          oclass = 0x90b1;
&gt;       else
&gt;          oclass = 0x95b1;
&gt; 
&gt; Since the kernel expects the 90b1 class to be used on the NVD9 card, despite
&gt; it having VP5. I've attached this change as a patch, please try it out. (If
&gt; you can't, I'll try to locate someone else with the relevant hardware, but
&gt; it'd be much easier if you could do it.)</span >

Patch works. Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396854560.dEAEFA0.16559--

--===============0866143531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0866143531==--
