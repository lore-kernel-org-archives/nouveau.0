From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27136] blank screen with G98 [Quadro NVS 420] (NV50)
 dual GPU, 4-head
Date: Mon,  2 May 2011 11:32:38 -0700 (PDT)
Message-ID: <20110502183239.050F513004E@annarchy.freedesktop.org>
References: <bug-27136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27136

Charles R. Anderson <cra-WCkJK2/AXBA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cra-WCkJK2/AXBA@public.gmane.org

--- Comment #7 from Charles R. Anderson <cra-WCkJK2/AXBA@public.gmane.org> 2011-05-02 11:32:38 PDT ---
I have the same setup, but with 2 DisplayPort monitors and 2 DVI monitors via
DP->DVI adapters.  This is currently working only with the nvidia driver under
Fedora 13:

<NVS420>[VHDCI]-+---[DP1][DP3]
                |
                +---[DP2][DP4]
                      |    |
                  [DVI2]  [DVI4]

I also needed to supply EDID dump files of the two DVI monitors directly to the
X server in order for them to work correctly, even with the nvidia driver:

Section "Screen"
  Option         "CustomEDID" "DFP-0:/etc/X11/2001fp-edid.bin;
DFP-1:/etc/X11/2001fp-edid.bin"

DP2/DVI2 shows up as DFP-0 at PCI:4:0:0 (GPU-0)
DP4/DVI4 shows up as DFP-1 at PCI:4:0:0 (GPU-0)
DP1 shows up as DFP-2 at PCI:3:0:0 (GPU-1)
DP3 shows up as DFP-3 at PCI:3:0:0 (GPU-1)

I have a serial console hooked up in order to be able to perform any necessary
debugging.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
