From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Tue, 19 Feb 2013 23:46:24 +0000
Message-ID: <bug-59069-8800-1SFGrICB0l@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0934120955=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0934120955==
Content-Type: multipart/alternative; boundary="1361317584.A11f3.27354"; charset="us-ascii"


--1361317584.A11f3.27354
Date: Tue, 19 Feb 2013 23:46:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

--- Comment #22 from gianogli <gianogli-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
(In reply to comment #21)
> Created attachment 75140 [details]
> A trace of this bug

I can confirm this bug.

I've this trace (attachment 75140) in my HP workstation usually after 6/7 days
of nonstop use.

Some information of my system:

Debian testing
kernel: 3.7.7 (Vanilla)
xserver-xorg-video-nouveau: 1.0.1-5

40:00.0 VGA compatible controller: NVIDIA Corporation NV44 [Quadro NVS 285]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 0334
        Physical Slot: 2
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at f8000000 (32-bit, non-prefetchable) [size=16M]
        Memory at f0000000 (64-bit, prefetchable) [size=128M]
        Memory at f9000000 (64-bit, non-prefetchable) [size=16M]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Kernel driver in use: nouveau

If you want I can send to you some other info or apply a patch to try to solve
the issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361317584.A11f3.27354
Date: Tue, 19 Feb 2013 23:46:24 +0000
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
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:gianogli&#64;tiscali.it" title="gianogli &lt;gianogli&#64;tiscali.it&gt;"> <span class="fn">gianogli</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=59069#c21">comment #21</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=75140" name="attach_75140" title="A trace of this bug">attachment 75140</a> <a href="attachment.cgi?id=75140&amp;action=edit" title="A trace of this bug">[details]</a></span>
&gt; A trace of this bug</span >

I can confirm this bug.

I've this trace (<span class=""><a href="attachment.cgi?id=75140" name="attach_75140" title="A trace of this bug">attachment 75140</a> <a href="attachment.cgi?id=75140&amp;action=edit" title="A trace of this bug">[details]</a></span>) in my HP workstation usually after 6/7 days
of nonstop use.

Some information of my system:

Debian testing
kernel: 3.7.7 (Vanilla)
xserver-xorg-video-nouveau: 1.0.1-5

40:00.0 VGA compatible controller: NVIDIA Corporation NV44 [Quadro NVS 285]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 0334
        Physical Slot: 2
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at f8000000 (32-bit, non-prefetchable) [size=16M]
        Memory at f0000000 (64-bit, prefetchable) [size=128M]
        Memory at f9000000 (64-bit, non-prefetchable) [size=16M]
        Expansion ROM at &lt;unassigned&gt; [disabled]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Kernel driver in use: nouveau

If you want I can send to you some other info or apply a patch to try to solve
the issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361317584.A11f3.27354--

--===============0934120955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0934120955==--
