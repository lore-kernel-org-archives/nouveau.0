From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Is binary firmware still necessary for GTX660 card
 (NVE0 family) in order to use DRM and/or VDPAU video acceleration?
Date: Thu, 12 Dec 2013 13:16:17 +0100
Message-ID: <52A9A911.7000100@free.fr>
References: <CAN39ZY-1Z=t7i8e=jFYaNH8Tj32J62da085N3uTi-P-8-rp9Uw@mail.gmail.com>	<52A9697A.4050204@free.fr>
	<CAN39ZY_QyO8N2TG2+JeAKvW1b9L74jmG8GEMRVfBexKsKFiFow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0165587642=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAN39ZY_QyO8N2TG2+JeAKvW1b9L74jmG8GEMRVfBexKsKFiFow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0165587642==
Content-Type: multipart/alternative;
 boundary="------------090901020704020100010406"

This is a multi-part message in MIME format.
--------------090901020704020100010406
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 12/12/2013 08:58, Matthias Nagel a =E9crit :
> Hi Martin,
> if you refer to my kernel version. 3.10.17 is the latest, stable=20
> version in the official gentoo repository for the amd64 architeture.=20
> See here
...
> [4] https://packages.gentoo.org/package/sys-kernel/gentoo-sources?full_=
cat
>
> As long as I do not miss any features, I stay with the stable version.
Indeed, you are doing the right thing, I guess. But if you encounter any=20
sort of crash, I really advise you to go against gentoo on this and=20
update your kernel to the latest official release (3.12.x at the=20
moment). FYI, the 3.12 brings performance improvements to Nouveau too.
>
> Hence, if I understand you correctly, there are kernel version (newer=20
> than some unknown point in time) that already include the firmware? If=20
> this is the case, someone who knows the exact kernel version should=20
> mention that point on
>
> [1] http://nouveau.freedesktop.org/wiki/InstallDRM/
> [2] http://nouveau.freedesktop.org/wiki/VideoAcceleration/
> [3] https://bugs.gentoo.org/show_bug.cgi?id=3D480832
>
> and update the information.

What I wanted to say is that adding good fw support usually spans across=20
multiple kernels. Even 3.13 has kepler fw fixes IIRC and 3.14 will=20
receive some more updates to support new chipsets. It isn't a binary=20
thing so this is hard to tell we support a feature...

I guess we could tell when is the first free implementation (with the=20
possible fallback of using the blob's firmware[1]) and then when we=20
added support for all chipsets of the family and it has been=20
fairly-extensively tested and bug-free. Some cards would never pass the=20
test though :s

[1] NvGrUseFw, http://nouveau.freedesktop.org/wiki/KernelModuleParameters=
/

Cheers,
Martin
<http://nouveau.freedesktop.org/wiki/KernelModuleParameters/>

--------------090901020704020100010406
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Le 12/12/2013 08:58, Matthias Nagel a
      &eacute;crit&nbsp;:<br>
    </div>
    <blockquote
cite="mid:CAN39ZY_QyO8N2TG2+JeAKvW1b9L74jmG8GEMRVfBexKsKFiFow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org"
      type="cite">
      <div dir="ltr">
        <div>
          <div>Hi Martin,<br>
          </div>
          if you refer to my kernel version. 3.10.17 is the latest,
          stable version in the official gentoo repository for the amd64
          architeture. See here<br>
        </div>
      </div>
    </blockquote>
    ...<br>
    <blockquote
cite="mid:CAN39ZY_QyO8N2TG2+JeAKvW1b9L74jmG8GEMRVfBexKsKFiFow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org"
      type="cite">
      <div dir="ltr">
        <div>[4] <a moz-do-not-send="true"
href="https://packages.gentoo.org/package/sys-kernel/gentoo-sources?full_cat">https://packages.gentoo.org/package/sys-kernel/gentoo-sources?full_cat</a><br>
          <br>
        </div>
        <div>As long as I do not miss any features, I stay with the
          stable version.<br>
        </div>
      </div>
    </blockquote>
    Indeed, you are doing the right thing, I guess. But if you encounter
    any sort of crash, I really advise you to go against gentoo on this
    and update your kernel to the latest official release (3.12.x at the
    moment). FYI, the 3.12 brings performance improvements to Nouveau
    too.<br>
    <blockquote
cite="mid:CAN39ZY_QyO8N2TG2+JeAKvW1b9L74jmG8GEMRVfBexKsKFiFow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org"
      type="cite">
      <div dir="ltr">
        <div><br>
        </div>
        Hence, if I understand you correctly, there are kernel version
        (newer than some unknown point in time) that already include the
        firmware? If this is the case, someone who knows the exact
        kernel version should mention that point on<br>
        <br>
        [1] <a moz-do-not-send="true"
          href="http://nouveau.freedesktop.org/wiki/InstallDRM/"
          target="_blank">http://nouveau.freedesktop.org/wiki/InstallDRM/</a><br>
        [2] <a moz-do-not-send="true"
          href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/"
          target="_blank">http://nouveau.freedesktop.org/wiki/VideoAcceleration/</a><br>
        [3] <a moz-do-not-send="true"
          href="https://bugs.gentoo.org/show_bug.cgi?id=480832"
          target="_blank">https://bugs.gentoo.org/show_bug.cgi?id=480832</a><br>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">and update the information.<br>
        </div>
      </div>
    </blockquote>
    <br>
    What I wanted to say is that adding good fw support usually spans
    across multiple kernels. Even 3.13 has kepler fw fixes IIRC and 3.14
    will receive some more updates to support new chipsets. It isn't a
    binary thing so this is hard to tell we support a feature...<br>
    <br>
    I guess we could tell when is the first free implementation (with
    the possible fallback of using the blob's firmware[1]) and then when
    we added support for all chipsets of the family and it has been
    fairly-extensively tested and bug-free. Some cards would never pass
    the test though :s<br>
    <br>
    [1]
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <span style="color: rgb(46, 26, 5); font-family: monospace;
      font-size: 13px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: normal;
      orphans: auto; text-align: left; text-indent: 0px; text-transform:
      none; white-space: normal; widows: auto; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255); display: inline !important; float: none;">NvGrUseFw,</span>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a
      href="http://nouveau.freedesktop.org/wiki/KernelModuleParameters/">http://nouveau.freedesktop.org/wiki/KernelModuleParameters/</a><br>
    <br>
    Cheers,<br>
    Martin<br>
    <a
      href="http://nouveau.freedesktop.org/wiki/KernelModuleParameters/"></a>
  </body>
</html>

--------------090901020704020100010406--

--===============0165587642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0165587642==--
