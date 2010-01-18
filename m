From: Olivier Galibert <galibert@pobox.com>
Subject: Re: [PATCH] glsl: put varyings in texcoord slots
Date: Mon, 18 Jan 2010 21:37:04 +0100
Message-ID: <20100118203704.GA38129@dspnet.fr.eu.org>
References: <1263755124-4627-1-git-send-email-luca@luca-barbieri.com>
	<5d1e685e1001171906i685d1dd7xe0c1f7c589967b9f@mail.gmail.com>
	<ff13bc9a1001180622u7c9cd0f3x5315bd42a2eb3847@mail.gmail.com>
	<5d1e685e1001180752j2de0d211s64f8dd64ab12a4ae@mail.gmail.com>
	<a728f9f91001180759m5764c286l836bfb97ceb5b338@mail.gmail.com>
	<ff13bc9a1001180827y3e7b1edanc4e94577f08f4aa4@mail.gmail.com>
	<e7bd23c31001181141s3a3434fdkd85050eea7948164@mail.gmail.com>
	<ff13bc9a1001181206s6f0d2f51q4cbffe0baad46015@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa3d-dev-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <ff13bc9a1001181206s6f0d2f51q4cbffe0baad46015@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=mesa3d-dev>
List-Post: <mailto:mesa3d-dev@lists.sourceforge.net>
List-Help: <mailto:mesa3d-dev-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=subscribe>
Errors-To: mesa3d-dev-bounces@lists.sourceforge.net
To: Luca Barbieri <luca@luca-barbieri.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, mesa3d-dev@lists.sourceforge.net, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, Jan 18, 2010 at 09:06:01PM +0100, Luca Barbieri wrote:
> As for REing the tables, it may not be possible.
> This is the code that apparently sets them up right now:
> 	/* vtxprog output routing */
> 	so_method(so, screen->curie, 0x1fc4, 1);
> 	so_data  (so, 0x06144321);
> 	so_method(so, screen->curie, 0x1fc8, 2);
> 	so_data  (so, 0xedcba987);
> 	so_data  (so, 0x00000021);
> 	so_method(so, screen->curie, 0x1fd0, 1);
> 	so_data  (so, 0x00171615);
> 	so_method(so, screen->curie, 0x1fd4, 1);
> 	so_data  (so, 0x001b1a19);
> 
> This makes me think that only 4 bits might be used for the values
> (look at the arithmetic progressions of 4-bit values), so that there
> is a limit of 16 vertex output/fragment inputs.

Looking at the so_data values, 1fcx is 4 bits, 1fdx is 8 bits.  It's
also a little strange to have 24 slots for 16 possible values.


> If GLSL starts at index 10, we are still in trouble because less than
> 8 varyings will be available.

Shader model 4 requires at least 32 interpolated values.  Subsequent
versions will want more and more.  Any "start index" is going to blow
up someday unless it's a very large value (which 10 isn't).

  OG.


------------------------------------------------------------------------------
Throughout its 18-year history, RSA Conference consistently attracts the
world's best and brightest in the field, creating opportunities for Conference
attendees to learn about information security's most important issues through
interactions with peers, luminaries and emerging and established companies.
http://p.sf.net/sfu/rsaconf-dev2dev
