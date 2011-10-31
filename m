From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCH] drm: serialize access to debugs_nodes.list
Date: Mon, 31 Oct 2011 18:00:00 +0100
Message-ID: <20111031170000.GA3415@joi.lan>
References: <20111030220401.GA3628@joi.lan>
	<20111031080656.GD2920@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20111031080656.GD2920@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, Oct 31, 2011 at 09:06:57AM +0100, Daniel Vetter wrote:
> This is just ugly, you're adding a mutex to every drm_info_node, but only
> use the one embedded into the minor. On a quick grep we're only ever using
> the list in there, so I suggest to
> - replace minor->debugfs_node.list with minor->debugfs_list and kill
>   ->debugfs_node
> - add the mutex as minor->debugfs_lock
> That way it's clear what's going on.

Yes, you are right. I don't know what the heck I was thinking.

> Also, you've forgotten to add the locking to i915/i915_debugfs.c

Yeah. Will fix it too.

Marcin
