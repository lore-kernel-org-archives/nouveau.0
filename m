From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [i-g-t, v3,
 3/5] lib/igt_debugfs: Add igt_debugfs_pipe_dir()
Date: Tue, 18 Aug 2020 17:01:15 -0400
Message-ID: <20200818210115.GA53828@dev.jcline.org>
References: <20200417211025.109574-4-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200417211025.109574-4-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

On Fri, Apr 17, 2020 at 05:10:23PM -0400, Lyude wrote:
> From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> Like igt_debugfs_connector_dir(), but for pipes instead.
> 
> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  lib/igt_debugfs.c | 29 +++++++++++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index bf6be552..3c3b11e1 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -260,6 +260,35 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
>  	return ret;
>  }
>  
> +/**
> + * igt_debugfs_pipe_dir:
> + * @device: fd of the device
> + * @pipe: index of pipe
> + * @mode: mode bits as used by open()
> + *
> + * This opens the debugfs directory corresponding to the pipe index on the
> + * device for use with igt_sysfs_get() and related functions.
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_debugfs_pipe_dir(int device, int pipe, int mode)
> +{
> +	char buf[128];
> +	int dir, ret;
> +
> +	dir = igt_debugfs_dir(device);
> +	if (dir < 0)
> +		return dir;
> +
> +	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
> +	ret = openat(dir, buf, mode);
> +
> +	close(dir);
> +
> +	return ret;
> +}
> +

There seems to be a lot of overlap between this,
igt_debugfs_connector_dir(), and igt_debugfs_open(). As far as I can
tell, the latter two functions are completely identical so it's unclear
to me what the advantage of using one over the other is.

If I'm not mistaken igt_debugfs_pipe_dir() could be reduced to:

{
    char buf[128];
    snprintf(buf, sizeof(buf), "crtc-%d", pipe);
    return igt_debugfs_open(device, buf, mode);
}

and the docblock could just note it's sugar for igt_debugfs_open().

- Jeremy
