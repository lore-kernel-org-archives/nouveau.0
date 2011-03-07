From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gallium/nv50: use 0x8697 class on NVAF
Date: Mon, 7 Mar 2011 18:15:46 +0000
Message-ID: <AANLkTinJdfL13yT3hze+5vj8Kv9cAxCsF-4YCJt9Hebv@mail.gmail.com>
References: <20110222173240.GA9687@joi.lan>
	<20110304165017.GB2743@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110304165017.GB2743-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Mar 4, 2011 at 4:50 PM, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> On Tue, Feb 22, 2011 at 06:32:40PM +0100, Marcin Slusarz wrote:
>> Addresses: https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-=
nouveau/+bug/723012
>>
>> Reported-and-tested-by: Alan Pope
>> ---
>> =A0src/gallium/drivers/nv50/nv50_reg.h =A0 =A0| =A0 =A04 ++++
>> =A0src/gallium/drivers/nv50/nv50_screen.c | =A0 =A03 +++
>> =A02 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nv50/nv50_reg.h b/src/gallium/drivers/n=
v50/nv50_reg.h
>> index 949838b..90d77e5 100644
>> --- a/src/gallium/drivers/nv50/nv50_reg.h
>> +++ b/src/gallium/drivers/nv50/nv50_reg.h
>> @@ -1685,6 +1685,10 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN=
 THE SOFTWARE.
>>
>>
>>
>> +#define NVAFTCL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A00x00008697
>> +
>> +
>> +
>> =A0#define NV50_COMPUTE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 0x000050c0
>>
>> =A0#define =A0NV50_COMPUTE_NOP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A00x00000100
>> diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/driver=
s/nv50/nv50_screen.c
>> index edc3d54..8069509 100644
>> --- a/src/gallium/drivers/nv50/nv50_screen.c
>> +++ b/src/gallium/drivers/nv50/nv50_screen.c
>> @@ -389,6 +389,9 @@ nv50_screen_create(struct pipe_winsys *ws, struct no=
uveau_device *dev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0xac:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tesla_class =3D NVA0TCL;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 case 0xaf:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tesla_class =3D NVAFTCL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tesla_class =3D NVA8TCL;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> --
>> 1.7.4.rc3
>>
>
> ping
>
> if it's wrong for some reason, just say so...
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

The patch seems ok to me, the nitpicker in me would tell you to
separate the reported by and tested by tags and include Alan Pope's
email address :)

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
