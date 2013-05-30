From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64904] [BISECTED] nouveau,
 nv50: External VGA not detected anymore
Date: Thu, 30 May 2013 16:00:36 +0000
Message-ID: <bug-64904-8800-QcUkStQA6A@http.bugs.freedesktop.org/>
References: <bug-64904-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0960504280=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64904-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0960504280==
Content-Type: multipart/alternative; boundary="1369929636.64dA1Dfe2.11722"; charset="us-ascii"


--1369929636.64dA1Dfe2.11722
Date: Thu, 30 May 2013 16:00:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64904

--- Comment #12 from Joshua Baergen <joshuabaergen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can confirm this issue on a ThinkPad W530, NVIDIA Corporation GK107GLM
[Quadro K1000M] (rev a1).  I noticed the issue at work when I tried to connect
to VGA extender which in turn was hooked up to a projector.  However,
connecting directly to a VGA monitor worked fine.

I took Gerhard's suggestion and patched my 2.8.13 Gentoo kernel with the
nv50_dac_detect from ef22c8bb7b3fac45919b7fde412d36d1a8367d51 and I was then
able to connect to the projector.

FWIW, at least one other thing I noticed in the patch is that in the working
code, there's the following sequence:

1) Write (NV50_PDISPLAY_DAC_LOAD_CTRL_ACTIVE | load_pattern) to
DAC_LOAD_CTRL(i).
2) Read DAC_LOAD_CTRL(i).
3) Write 0 to DAC_LOAD_CTRL(i).

In the new code, it's:

1) Write (NV50_PDISPLAY_DAC_LOAD_CTRL_ACTIVE | load_pattern) to
DAC_LOAD_CTRL(i).
2) Write NV50_PDISPLAY_DAC_LOAD_CTRL_DONE to DAC_LOAD_CTRL(i).
3) Read DAC_LOAD_CTRL(i).

Being completely unfamiliar with the hardware, I'm not sure if this is
significant, and unfortunately, I don't have much (if any) opportunity to
experiment.

Josh

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369929636.64dA1Dfe2.11722
Date: Thu, 30 May 2013 16:00:36 +0000
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
   title="NEW --- - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64904#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64904">bug 64904</a>
              from <span class="vcard"><a class="email" href="mailto:joshuabaergen&#64;gmail.com" title="Joshua Baergen &lt;joshuabaergen&#64;gmail.com&gt;"> <span class="fn">Joshua Baergen</span></a>
</span></b>
        <pre>I can confirm this issue on a ThinkPad W530, NVIDIA Corporation GK107GLM
[Quadro K1000M] (rev a1).  I noticed the issue at work when I tried to connect
to VGA extender which in turn was hooked up to a projector.  However,
connecting directly to a VGA monitor worked fine.

I took Gerhard's suggestion and patched my 2.8.13 Gentoo kernel with the
nv50_dac_detect from ef22c8bb7b3fac45919b7fde412d36d1a8367d51 and I was then
able to connect to the projector.

FWIW, at least one other thing I noticed in the patch is that in the working
code, there's the following sequence:

1) Write (NV50_PDISPLAY_DAC_LOAD_CTRL_ACTIVE | load_pattern) to
DAC_LOAD_CTRL(i).
2) Read DAC_LOAD_CTRL(i).
3) Write 0 to DAC_LOAD_CTRL(i).

In the new code, it's:

1) Write (NV50_PDISPLAY_DAC_LOAD_CTRL_ACTIVE | load_pattern) to
DAC_LOAD_CTRL(i).
2) Write NV50_PDISPLAY_DAC_LOAD_CTRL_DONE to DAC_LOAD_CTRL(i).
3) Read DAC_LOAD_CTRL(i).

Being completely unfamiliar with the hardware, I'm not sure if this is
significant, and unfortunately, I don't have much (if any) opportunity to
experiment.

Josh</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369929636.64dA1Dfe2.11722--

--===============0960504280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0960504280==--
