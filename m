From: Pekka Paalanen <pq@iki.fi>
Subject: Re: MmioTrace: Using the Instruction Decoder, etc.
Date: Mon, 28 Oct 2013 13:30:49 +0200
Message-ID: <20131028133049.65adf92e@farn.lan>
References: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
	<20131017194614.64a6b70e@farn.lan>
	<CAL5fWtBS88Ni3bUiUgmaj32PQ7QHTnnRd9GEKW5uRJycxYY4Hg@mail.gmail.com>
	<20131019101417.50a33eaf@farn.lan>
	<CAL5fWtCUEfSSY=i-50SfgmTeuKgEh28wz492Be1ORJPidj_CvA@mail.gmail.com>
	<20131025120846.277e85aa@farn.lan>
	<CAL5fWtBggbZF3a3TaQ_Cx3QD_vXa2bT2behV20OdJN9DCKYh9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAL5fWtBggbZF3a3TaQ_Cx3QD_vXa2bT2behV20OdJN9DCKYh9g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Eugene Shatokhin <euspectre@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, 25 Oct 2013 17:19:56 +0400
Eugene Shatokhin <euspectre@gmail.com> wrote:

> Hi,
> 
> 2013/10/25 Pekka Paalanen <pq@iki.fi>
> 
...
> > We could use some comments from the real reverse-engineers. I used
> > to be mostly a tool writer.
> >
> 
> Yes, if some experts could share their knowledge of this matter, this would
> be most welcome!

Hi,

I got one comment in IRC, saying that a faster mmiotrace would be
nice, but probably not something he would invest time in.

Looking at it from that point of view, I guess mmiotrace works well enough,
and is "only" a reverse-engineering tool, not something used daily.
That, and the lack of replies here indicate that rewriting mmiotrace
with your approach might not be worth it. I don't think anyone
opposes to the idea, they just have better things to do.

It's all up to you, I believe.


Thanks,
pq
