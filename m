From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Tue, 29 Apr 2014 19:41:11 +0000
Message-ID: <bug-78092-8800-qCbqfQWfNC@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0004657512=="
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


--===============0004657512==
Content-Type: multipart/alternative; boundary="1398800471.A3E3e81.6896"; charset="us-ascii"


--1398800471.A3E3e81.6896
Date: Tue, 29 Apr 2014 19:41:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #2)
> (In reply to comment #1)
> > You should avoid bumblebee on recent kernels if you want to use nouveau.
> > Nouveau  should now (as of 3.12 or 3.13, iirc) auto-suspend when not in use
> > (assuming that it loads :) ). The first thing I'd do is get rid of bumblebee.
> 
> thanks for advice. I would love to follow, but this is my 1st optimus
> experience on Linux. I don't know any other way to use nvidia only when I
> need some more 3D power. I mean userland utilities. Can you give me some
> search hints?

None. More than likely, your Intel card will be faster than the GK208 with
nouveau, since we can't reclock. However if any outputs are directly attached
to the NVIDIA card, the functionality becomes a lot more useful.

See http://nouveau.freedesktop.org/wiki/Optimus/ for optimus information. To
offload 3D, once it's set up, you'd do DRI_PRIME=1 foo-app.

> 
> > 
> > I'm pretty sure this isn't your problem, since it should be getting detected
> > as an optimus system, but perhaps something like
> > http://cgit.freedesktop.org/~darktama/nouveau/commit/
> > ?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63 would help. Or the vbios should
> > be read from PROM but it's hitting the issue that keplers don't support
> > 8-bit reads from PROM (which should be addressed in 3.15-rc1+), see
> > http://cgit.freedesktop.org/~darktama/nouveau/commit/
> > ?id=6b6d97553de21cf3f7b3b7fe7e57a16ac41ee2ac .
> 
> Can you advise which patch better suits my kernel? Or should I try both?

Step 1: Try 3.14.x, without any bumblebee stuff.
Step 2: Try 3.15-rc3 without any bumblebee stuff.
Step 3: Try applying the first patch (since it still hasn't hit upstream trees)
to 3.15-rc3. You'll need to be a bit creative when applying it, since it's
against a differently-formatted tree. It just removes 2 lines, so you can
always do it by hand.

If all of that still fails to find a VBIOS, attach a fresh dmesg (with 3.15-rc3
+ the patch to use acpi method even if not optimus), and an acpidump output.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398800471.A3E3e81.6896
Date: Tue, 29 Apr 2014 19:41:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78092#c2">comment #2</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=78092#c1">comment #1</a>)
&gt; &gt; You should avoid bumblebee on recent kernels if you want to use nouveau.
&gt; &gt; Nouveau  should now (as of 3.12 or 3.13, iirc) auto-suspend when not in use
&gt; &gt; (assuming that it loads :) ). The first thing I'd do is get rid of bumblebee.
&gt; 
&gt; thanks for advice. I would love to follow, but this is my 1st optimus
&gt; experience on Linux. I don't know any other way to use nvidia only when I
&gt; need some more 3D power. I mean userland utilities. Can you give me some
&gt; search hints?</span >

None. More than likely, your Intel card will be faster than the GK208 with
nouveau, since we can't reclock. However if any outputs are directly attached
to the NVIDIA card, the functionality becomes a lot more useful.

See <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a> for optimus information. To
offload 3D, once it's set up, you'd do DRI_PRIME=1 foo-app.

<span class="quote">&gt; 
&gt; &gt; 
&gt; &gt; I'm pretty sure this isn't your problem, since it should be getting detected
&gt; &gt; as an optimus system, but perhaps something like
&gt; &gt; <a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/">http://cgit.freedesktop.org/~darktama/nouveau/commit/</a>
&gt; &gt; ?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63 would help. Or the vbios should
&gt; &gt; be read from PROM but it's hitting the issue that keplers don't support
&gt; &gt; 8-bit reads from PROM (which should be addressed in 3.15-rc1+), see
&gt; &gt; <a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/">http://cgit.freedesktop.org/~darktama/nouveau/commit/</a>
&gt; &gt; ?id=6b6d97553de21cf3f7b3b7fe7e57a16ac41ee2ac .
&gt; 
&gt; Can you advise which patch better suits my kernel? Or should I try both?</span >

Step 1: Try 3.14.x, without any bumblebee stuff.
Step 2: Try 3.15-rc3 without any bumblebee stuff.
Step 3: Try applying the first patch (since it still hasn't hit upstream trees)
to 3.15-rc3. You'll need to be a bit creative when applying it, since it's
against a differently-formatted tree. It just removes 2 lines, so you can
always do it by hand.

If all of that still fails to find a VBIOS, attach a fresh dmesg (with 3.15-rc3
+ the patch to use acpi method even if not optimus), and an acpidump output.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398800471.A3E3e81.6896--

--===============0004657512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0004657512==--
