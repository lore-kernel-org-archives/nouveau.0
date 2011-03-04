From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gallium/nv50: use 0x8697 class on NVAF
Date: Fri, 4 Mar 2011 17:50:17 +0100
Message-ID: <20110304165017.GB2743@joi.lan>
References: <20110222173240.GA9687@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110222173240.GA9687-OI9uyE9O0yo@public.gmane.org>
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

On Tue, Feb 22, 2011 at 06:32:40PM +0100, Marcin Slusarz wrote:
> Addresses: https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/723012
> 
> Reported-and-tested-by: Alan Pope
> ---
>  src/gallium/drivers/nv50/nv50_reg.h    |    4 ++++
>  src/gallium/drivers/nv50/nv50_screen.c |    3 +++
>  2 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/src/gallium/drivers/nv50/nv50_reg.h b/src/gallium/drivers/nv50/nv50_reg.h
> index 949838b..90d77e5 100644
> --- a/src/gallium/drivers/nv50/nv50_reg.h
> +++ b/src/gallium/drivers/nv50/nv50_reg.h
> @@ -1685,6 +1685,10 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  
>  
>  
> +#define NVAFTCL										0x00008697
> +
> +
> +
>  #define NV50_COMPUTE									0x000050c0
>  
>  #define  NV50_COMPUTE_NOP								0x00000100
> diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
> index edc3d54..8069509 100644
> --- a/src/gallium/drivers/nv50/nv50_screen.c
> +++ b/src/gallium/drivers/nv50/nv50_screen.c
> @@ -389,6 +389,9 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
>  		case 0xac:
>  			tesla_class = NVA0TCL;
>  			break;
> +		case 0xaf:
> +			tesla_class = NVAFTCL;
> +			break;
>  		default:
>  			tesla_class = NVA8TCL;
>  			break;
> -- 
> 1.7.4.rc3
> 

ping

if it's wrong for some reason, just say so...
