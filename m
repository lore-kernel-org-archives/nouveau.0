From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58776] DRM NOUVEAU: cannot boot with kernel >=3.7
Date: Thu, 27 Dec 2012 19:14:58 +0000
Message-ID: <bug-58776-8800-sDXm6GS4Mr@http.bugs.freedesktop.org/>
References: <bug-58776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0518670179=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58776-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0518670179==
Content-Type: multipart/alternative; boundary="1356635698.F7241.30878"; charset="us-ascii"


--1356635698.F7241.30878
Date: Thu, 27 Dec 2012 19:14:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58776

--- Comment #4 from gabriele balducci <balducci-KqplAB4qOuE@public.gmane.org> ---
I have done some more experiments.

Following discussions in bug#46557 and bug#54988, I have tried both
https://bugs.freedesktop.org/attachment.cgi?id=63137 and the mem=2G
kernel opt.

The former does not have any effect, while the latter works (with
mem=2G I can boot fine and also X11 runs nicely)

I would not be in favor of a buggy hardware, since the GPU works without any
problem with kernel 3.6.x (i.e., no need to append any mem=2G
option).

I would rather think about changes between 3.6/3.7, but, as I
told above, my knowledge about the whole matter is less than poor...

thank you very much in advance for any help

ciao
gabriele

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356635698.F7241.30878
Date: Thu, 27 Dec 2012 19:14:58 +0000
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
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58776#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58776">bug 58776</a>
              from <span class="vcard"><a class="email" href="mailto:balducci&#64;units.it" title="gabriele balducci &lt;balducci&#64;units.it&gt;"> <span class="fn">gabriele balducci</span></a>
</span></b>
        <pre>I have done some more experiments.

Following discussions in <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="show_bug.cgi?id=46557">bug#46557</a> and <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [C51PV] Garbage on initial Console Screen"
   href="show_bug.cgi?id=54988">bug#54988</a>, I have tried both
<a href="https://bugs.freedesktop.org/attachment.cgi?id=63137">https://bugs.freedesktop.org/attachment.cgi?id=63137</a> and the mem=2G
kernel opt.

The former does not have any effect, while the latter works (with
mem=2G I can boot fine and also X11 runs nicely)

I would not be in favor of a buggy hardware, since the GPU works without any
problem with kernel 3.6.x (i.e., no need to append any mem=2G
option).

I would rather think about changes between 3.6/3.7, but, as I
told above, my knowledge about the whole matter is less than poor...

thank you very much in advance for any help

ciao
gabriele</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356635698.F7241.30878--

--===============0518670179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0518670179==--
