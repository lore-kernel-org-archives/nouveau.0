From: Brian Paul <brianp@vmware.com>
Subject: Re: [PATCH 2/2] st: don't assert on empty fragment
 program
Date: Mon, 18 Jan 2010 11:26:14 -0700
Message-ID: <4B54A7C6.4060402@vmware.com>
References: <1263764160-8891-1-git-send-email-luca@luca-barbieri.com>	
	<1263764160-8891-2-git-send-email-luca@luca-barbieri.com>	
	<4B54A208.10803@vmware.com>
	<ff13bc9a1001181015u4943a6edm4098145a12e72804@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa3d-dev-bounces@lists.sourceforge.net>
In-Reply-To: <ff13bc9a1001181015u4943a6edm4098145a12e72804@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=mesa3d-dev>
List-Post: <mailto:mesa3d-dev@lists.sourceforge.net>
List-Help: <mailto:mesa3d-dev-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=subscribe>
Errors-To: mesa3d-dev-bounces@lists.sourceforge.net
To: Luca Barbieri <luca@luca-barbieri.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa3d-dev@lists.sourceforge.net" <mesa3d-dev@lists.sourceforge.net>
List-Id: nouveau.vger.kernel.org

Luca Barbieri wrote:
> Breakpoint 3, _mesa_ProgramStringARB (target=34820, format=34933,
> len=70, string=0x85922ba) at shader/arbprogram.c:434
> 434	   GET_CURRENT_CONTEXT(ctx);
> $31 = 0x85922ba "!!ARBfp1.0\n    \n    OPTION
> ARB_precision_hint_fastest;\n    \n\n\n    END\n"
> 
> Not sure why Sauerbraten does this, but it does, at least on my system
> (Ubuntu Karmic, nv40 driver) and it should be legal.

OK, GL_ARB_fragment_programs says a fragment program does not have to 
write a color result (so the color is undefined).

But the assertion should be changed to "num instructions > 0" and not 
removed.  I'll fix that.

-Brian


------------------------------------------------------------------------------
Throughout its 18-year history, RSA Conference consistently attracts the
world's best and brightest in the field, creating opportunities for Conference
attendees to learn about information security's most important issues through
interactions with peers, luminaries and emerging and established companies.
http://p.sf.net/sfu/rsaconf-dev2dev
