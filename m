From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [Intel-gfx] v3.17, i915 vs nouveau: possible recursive locking
 detected
Date: Sat, 18 Oct 2014 12:04:32 +0200
Message-ID: <20141018120432.1c061ea7@jbarnes-t420>
References: <20141013184033.GA5526@marcin-Inspiron-7720>
 <20141016114738.GB1704@bremse.fdxtended.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20141016114738.GB1704@bremse.fdxtended.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Marcin =?UTF-8?B?xZpsdXNhcno=?= <marcin.slusarz@gmail.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Thu, 16 Oct 2014 13:47:38 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> We need ww mutexes and need to rewrite i915 a bit fo fix this all.
> I.e. known issue. As long as your userspace isn't nasty nothing bad
> will ever happen though.

So do we already have a bug open with a good description of the issue?
Eventually the streets will run with blood and we'll enter the 6th
republic of i915, so it would be good to have it on the hit list for
when the time comes...

Thanks,
Jesse
