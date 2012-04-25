From: Christoph Bumiller <e0425955@student.tuwien.ac.at>
Subject: Re: [Nouveau] [RFC PATCH 5/5] drm/nouveau: gpu lockup recovery
Date: Wed, 25 Apr 2012 13:06:44 +0200
Message-ID: <4F97DAC4.4060109@student.tuwien.ac.at>
References: <1335133112-8008-5-git-send-email-marcin.slusarz@gmail.com>
	<4F95161C.9070403@free.fr> <20120423163257.GA2886@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20120423163257.GA2886@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 04/23/2012 06:32 PM, Marcin Slusarz wrote:
> You can run fs-discard-exit-2 test first - for me it causes instant GPU lockup.
> 

That's because it's designed (but not supposed) to do that, it also
locks up with the blob, it's a harmless shader infinite loop.

(May be a bug in the MPs or a wrong setting somewhere, but they don't
pop the control flow stack if all but killed pixels of a partially
killed quad remain on the current execution path).

Activated the watchdog on nv50 now, too, if you want to produce the
lockup with current mesa git run with NOUVEAU_SHADER_WATCHDOG=0 (yes
when we use COMPUTE it will have to be deactivated as well).

> Marcin
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 
