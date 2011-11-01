From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: custom monitor formats
Date: Tue, 1 Nov 2011 07:56:52 +0100
Message-ID: <CAGZ4FEQOBtHB3kBLC4xvFjnrE4b=cDtKOXZXsv_ND3h4gMsatg@mail.gmail.com>
References: <op.v38d0basymuwjf@coyote.billshome>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <op.v38d0basymuwjf-5aa3G60FVSHexO4I5m3DPg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: William Moss <bill.m.moss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Oct 31, 2011 at 8:34 PM, William Moss <bill.m.moss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I recently updated from OpenSUSE 11.3 to 11.4.
> The proprietary Nvidia driver will no longer work, even the latest
> NVIDIA...run.
> I removed it and set up nouveau, which works fine except it ignores my
> customized
> /etc/xorg.conf.d files and sets my monitor to 1024x768.
>
> The monitor, an ACER AL1916W should be run at 1440x900 and this is the
> preferred
> mode (modeline) in the configuration files. This is how it worked with the
> NVIDIA
> drivers and should be still true.
>
> Apparently, the nouveau module (driver) is ignoring the settings in the
> /etc/xorg.d/50-device.conf and the associated conf files that are bound
> in the server conf file.
>
> I tested the setup with
> =A0 =A0 =A0 =A0xinit -- :0
> which works but at the incorrect resolution.
>
> I even tried a customized and compiled 3.0.4 Kernel, to no avail.
>
> Any help would be appreciated.
> I have no problem with compiling and installing or even modifying source.

In general it is helpful to include xorg.conf and the xorg log, in
this specific case it might also be useful to include the output of
"xrandr --verbose".

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
