From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv50: decode PGRAPH status registers on
 TLB flush fail
Date: Wed, 7 Nov 2012 20:04:41 +0100
Message-ID: <20121107190441.GC24379@joi.lan>
References: <1352238533-14920-4-git-send-email-marcin.slusarz@gmail.com>
	<20121107000847.GA21065@turiel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121107000847.GA21065-yqdYmcOkqV0XGNroddHbYwC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Nov 07, 2012 at 10:08:47AM +1000, Ben Skeggs wrote:
> On Tue, Nov 06, 2012 at 10:48:52PM +0100, Marcin Slusarz wrote:
> > Now it outputs:
> > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH TLB flush idle timeout fail
> > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_STATUS: BUSY DISPATCH VFETCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK1CXX CLIPID ZCULL ENG2D UNK34XX TPRAST TPROP ROP (0x011fde03)
> > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS: CCACHE (0x00145b4d) (0x0000002d) ENG2D ROP (0x0034db40)
> 
> How about this instead?
> 
> PGRAPH_STATUS  : 0x011fde03 [BUSY DISPATCH VFETCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK1CXX CLIPID ZCULL ENG2D UNK34XX TPRAST TPROP ROP]
> PGRAPH_VSTATUS0: 0x00145b4d [CCACHE]
> PGRAPH_VSTATUS1: 0x0000002d []
> PGRAPH_VSTATUS2: 0x0034db40 [ENG2D ROP]

Looks good too. I'll post updated patch tomorrow.

Marcin
