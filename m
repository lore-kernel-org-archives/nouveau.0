From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Bug with nouveau at boot
Date: Fri, 28 Feb 2014 12:42:32 -0500
Message-ID: <CAKb7UvijfN0TmBGbkqTiYkOKkSN05vAGk3ho5rWL2j_Mbg16Lw@mail.gmail.com>
References: <BLU0-SMTP209F29B835B468010DE06ECB820@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BLU0-SMTP209F29B835B468010DE06ECB820-MsuGFMq8XAE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Aur=E9lien_Rivet?= <aurelienrivet-PkbjNfxxIARGWvitb5QawA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Feb 28, 2014 at 12:01 PM, Aur=E9lien Rivet
<aurelienrivet-PkbjNfxxIARGWvitb5QawA@public.gmane.org> wrote:
> Hello,
> First, my apologies for my rubbish English .
> I come from the archlinux forum, because a user suggested me to ask here =
my
> question.
> I have the two following lines on boot (and into dmesg) :
>
> [   13.673400] nouveau E[     DRM] Pointer to TMDS table invalid
> [   13.673429] nouveau E[     DRM] Pointer to flat panel table invalid
>
> I don't know what it mean and if it is important or not but if it is, how
> can I repair it ?

The VBIOS is composed of, among other things, a bunch of tables. There
are pointers to where those tables live in the headers. This is saying
that the pointers to a few of the tables are invalid. If this is not a
laptop and does not have a DVI/HDMI output, it should be of no
concern. Further, if things work OK, I wouldn't worry about it either.

  -ilia
