From: Jakob Bornecrantz <wallbraker@gmail.com>
Subject: Re: [PATCH 3/3] gallium/trace: check
 bind_vertex_sampler_states and set_vertex_sampler_views
Date: Sun, 5 Dec 2010 01:30:57 +0100
Message-ID: <AANLkTimn2tHT0og8q-bKUzvNiZDMKMbEb81EzepebDXC@mail.gmail.com>
References: <1291508190-10771-1-git-send-email-chantry.xavier@gmail.com>
	<1291508190-10771-3-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1291508190-10771-3-git-send-email-chantry.xavier@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Xavier Chantry <chantry.xavier@gmail.com>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, Dec 5, 2010 at 1:16 AM, Xavier Chantry <chantry.xavier@gmail.com> wrote:
> cso_cache_delete checks if pipe has bind_vertex_sampler_states and
> set_vertex_sampler_views so do the same in tr_context.
>
> This avoids a segfault when tracing nvfx driver on piglit
> glx-destroycontext-2

Reviewed-by: Jakob Bornecrantz <wallbraker@gmail.com>

[SNIP]
