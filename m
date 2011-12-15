From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37669] [NVAC] problem when unplugging DP-1
Date: Thu, 15 Dec 2011 15:47:52 +0000
Message-ID: <bug-37669-8800-0INlz1iveD@http.bugs.freedesktop.org/>
References: <bug-37669-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37669-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37669

--- Comment #5 from Antoine Reversat <a.reversat-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-12-15 07:47:52 PST ---
So I've gotten a bit further.

I tracked down the code that triggers the issue : it's this part of nv50_sor.c
:

        if (!nv_wait(dev, NV50_PDISPLAY_SOR_DPMS_CTRL(or),
                    NV50_PDISPLAY_SOR_DPMS_CTRL_PENDING, 0)) {
            NV_ERROR(dev, "timeout: SOR_DPMS_CTRL_PENDING(%d) == 0\n", or);
            NV_ERROR(dev, "SOR_DPMS_CTRL(%d) = 0x%08x\n", or,
                    nv_rd32(dev, NV50_PDISPLAY_SOR_DPMS_CTRL(or)));
        }

        val = nv_rd32(dev, NV50_PDISPLAY_SOR_DPMS_CTRL(or));

        if (mode == DRM_MODE_DPMS_ON)
            val |= NV50_PDISPLAY_SOR_DPMS_CTRL_ON;
        else
            val &= ~NV50_PDISPLAY_SOR_DPMS_CTRL_ON;

        nv_wr32(dev, NV50_PDISPLAY_SOR_DPMS_CTRL(or), val |
                NV50_PDISPLAY_SOR_DPMS_CTRL_PENDING);
        if (!nv_wait(dev, NV50_PDISPLAY_SOR_DPMS_STATE(or),
                    NV50_PDISPLAY_SOR_DPMS_STATE_WAIT, 0)) {
            NV_ERROR(dev, "timeout: SOR_DPMS_STATE_WAIT(%d) == 0\n", or);
            NV_ERROR(dev, "SOR_DPMS_STATE(%d) = 0x%08x\n", or,
                    nv_rd32(dev, NV50_PDISPLAY_SOR_DPMS_STATE(or)));
        }


If I add an if to skip the code if the sor is going to DPMS off and the encoder
type is tmds then the bug doesn't happen anymore. I don't understand how this
affects sor0 (which the LVDS output is using) as the code seems pretty sane.

I also noted something and am not sure whether it's correct or not. My flat
panel is connected through a DP-DVI adapter but nv_encoder->dcb->type is
OUTPUT_TMDS not OUTPUT_DP. Is this due to the fact that it's "DVI over DP" ? Or
is this not normal ?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
