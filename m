From: Xavier Chantry <chantry.xavier@gmail.com>
Subject: Re: drm-nouveau - more gl extensions?
Date: Fri, 23 Apr 2010 11:21:00 +0200
Message-ID: <p2ib67489df1004230221n33afc43ej5d378c2cf352f1bc@mail.gmail.com>
References: <4BD02BA9.20406@interia.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <4BD02BA9.20406@interia.pl>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: yaiba.kurogane@interia.pl
Cc: mesa-dev@lists.freedesktop.org, nouveau <Nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 22, 2010 at 12:57 PM,  <yaiba.kurogane@interia.pl> wrote:
> Hello. I have old nvidia hardware (NV17) and noticed that some extensions
> are missing.They will be added in near future ? Anyone from nouveau
> developers actually working on driver for such old hw ???

A few months ago :
15:27 < curro_> hmm, or we could expose gl1.3 already, IIRC the only
thing left is cube mapping

curro is the one that resurrected the nv10-nv20 driver and got it to a
nicer state.
He seemed less active recently, so probably busy with other things
like work and/or life.

I guess it depends on what extension / what gl version you are talking
about and how complex they are to implement.
And I suppose they are all supported by the blob (nvidia proprietary driver) ?

(kept mesa in CC this time)
