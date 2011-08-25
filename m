From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] drm/nv04/crtc: Bail out if FB is not bount to
 crtc
Date: Thu, 25 Aug 2011 14:14:37 -0700
Message-ID: <20110825211437.GB26773@kroah.com>
References: <1314304611-5869-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <stable-bounces@linux.kernel.org>
Content-Disposition: inline
In-Reply-To: <1314304611-5869-1-git-send-email-emil.l.velikov@gmail.com>
List-Unsubscribe: <http://linux.kernel.org/mailman/options/stable>,
 <mailto:stable-request@linux.kernel.org?subject=unsubscribe>
List-Archive: <http://linux.kernel.org/mailman/private/stable/>
List-Post: <mailto:stable@linux.kernel.org>
List-Help: <mailto:stable-request@linux.kernel.org?subject=help>
List-Subscribe: <http://linux.kernel.org/mailman/listinfo/stable>,
 <mailto:stable-request@linux.kernel.org?subject=subscribe>
Sender: stable-bounces@linux.kernel.org
Errors-To: stable-bounces@linux.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: nouveau@lists.freedesktop.org, stable@kernel.org
List-Id: nouveau.vger.kernel.org

On Thu, Aug 25, 2011 at 09:36:51PM +0100, Emil Velikov wrote:
> This commit resolves a possible 'NULL pointer dereference'
> It uses the same approach as radeon, intel and nouveau/nv50
> 
> Fixes bug 'Nouveau: Kernel oops when unplugging external monitor'
> https://bugs.freedesktop.org/show_bug.cgi?id=40336
> 
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nv04_crtc.c |   15 +++++++++++++--
>  1 files changed, 13 insertions(+), 2 deletions(-)


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>

_______________________________________________
stable mailing list
stable@linux.kernel.org
http://linux.kernel.org/mailman/listinfo/stable
