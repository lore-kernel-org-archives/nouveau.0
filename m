From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: serialize access to list of debugfs files
Date: Mon, 31 Oct 2011 22:00:04 +0100
Message-ID: <20111031210004.GB30108@phenom.ffwll.local>
References: <20111030220401.GA3628@joi.lan>
	<20111031080656.GD2920@phenom.ffwll.local>
	<20111031170000.GA3415@joi.lan> <20111031173357.GA28581@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20111031173357.GA28581@joi.lan>
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

On Mon, Oct 31, 2011 at 06:33:57PM +0100, Marcin Slusarz wrote:
> Nouveau, when configured with debugfs, creates debugfs files for every
> channel, so structure holding list of files needs to be protected from
> simultaneous changes by multiple threads.
> 
> Without this patch it's possible to hit kernel oops in
> drm_debugfs_remove_files just by running a couple of xterms with
> looped glxinfo.
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>

And v2 also includes a nice comment in the header explaining the locking.
Awesome!
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
