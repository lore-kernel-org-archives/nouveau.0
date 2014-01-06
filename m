From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68835] [NV04] Script offset calculated incorrectly
 for some BMP 1.x VBIOSes
Date: Mon, 06 Jan 2014 20:43:07 +0000
Message-ID: <bug-68835-8800-e6X0uWGluJ@http.bugs.freedesktop.org/>
References: <bug-68835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0520412584=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0520412584==
Content-Type: multipart/alternative; boundary="1389040987.EE5A5Ca2.32448"; charset="us-ascii"


--1389040987.EE5A5Ca2.32448
Date: Mon, 6 Jan 2014 20:43:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68835

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #7)
> Hi Ilia,
> is there a guide anywhere on how to apply a patch, build the patched driver
> and use it for testing? I'm not a Linux kernel expert...

Grab a copy of the kernel (the patch is against 3.13-rc7, but it should apply
cleanly to just about any 3.7+ version), apply the patch (patch -p1 <
thepatch), and then build as usual.

Here's a (fairly complex) guide to building kernels on Fedora:

https://fedoraproject.org/wiki/Building_a_custom_kernel

Although that is for generating rpm's... you can probably do something much
simpler for just a local install, but I can't help with that (these distros
tend to expect initrd's, etc, which I know fairly little about and thus avoid).

Let me know if you don't plan on testing this out in the next week or so; I
think the patch is fairly safe to just check in anyways, so you'd be able to
test it out eventually in a future release.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389040987.EE5A5Ca2.32448
Date: Mon, 6 Jan 2014 20:43:07 +0000
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
   title="NEW --- - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">bug 68835</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68835#c7">comment #7</a>)
<span class="quote">&gt; Hi Ilia,
&gt; is there a guide anywhere on how to apply a patch, build the patched driver
&gt; and use it for testing? I'm not a Linux kernel expert...</span >

Grab a copy of the kernel (the patch is against 3.13-rc7, but it should apply
cleanly to just about any 3.7+ version), apply the patch (patch -p1 &lt;
thepatch), and then build as usual.

Here's a (fairly complex) guide to building kernels on Fedora:

<a href="https://fedoraproject.org/wiki/Building_a_custom_kernel">https://fedoraproject.org/wiki/Building_a_custom_kernel</a>

Although that is for generating rpm's... you can probably do something much
simpler for just a local install, but I can't help with that (these distros
tend to expect initrd's, etc, which I know fairly little about and thus avoid).

Let me know if you don't plan on testing this out in the next week or so; I
think the patch is fairly safe to just check in anyways, so you'd be able to
test it out eventually in a future release.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389040987.EE5A5Ca2.32448--

--===============0520412584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0520412584==--
