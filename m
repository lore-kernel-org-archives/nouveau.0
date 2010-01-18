From: Brian Paul <brianp@vmware.com>
Subject: Re: [PATCH 2/2] st: don't assert on empty fragment
	program
Date: Mon, 18 Jan 2010 11:01:44 -0700
Message-ID: <4B54A208.10803@vmware.com>
References: <1263764160-8891-1-git-send-email-luca@luca-barbieri.com>
	<1263764160-8891-2-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa3d-dev-bounces@lists.sourceforge.net>
In-Reply-To: <1263764160-8891-2-git-send-email-luca@luca-barbieri.com>
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
> Sauerbraten triggers this assert.
> ---
>  src/mesa/state_tracker/st_atom_shader.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/src/mesa/state_tracker/st_atom_shader.c b/src/mesa/state_tracker/st_atom_shader.c
> index 176f3ea..fce533a 100644
> --- a/src/mesa/state_tracker/st_atom_shader.c
> +++ b/src/mesa/state_tracker/st_atom_shader.c
> @@ -79,8 +79,6 @@ translate_fp(struct st_context *st,
>  
>        stfp->num_input_slots = numIn;
>  
> -      assert(stfp->Base.Base.NumInstructions > 1);
> -
>        st_translate_fragment_program(st, stfp, stfp->input_to_slot);
>     }
>  }

How do we end up with a shader that has only one instruction (or 
none)?  Is it an END instruction?  I'd like to learn more about what's 
happening before committing this.

-Brian


------------------------------------------------------------------------------
Throughout its 18-year history, RSA Conference consistently attracts the
world's best and brightest in the field, creating opportunities for Conference
attendees to learn about information security's most important issues through
interactions with peers, luminaries and emerging and established companies.
http://p.sf.net/sfu/rsaconf-dev2dev
