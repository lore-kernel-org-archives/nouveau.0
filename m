From: Jean Chorin <jean.chorin-omI3DanSII5nItmLHl24hw@public.gmane.org>
Subject: Questions about envytools: reading card VBIOS
Date: Wed, 20 Mar 2019 16:49:34 +0100
Message-ID: <3e7d4b6d-cd35-8c98-7a7c-372cec359cd3@cloudandheat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1894625767=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1894625767==
Content-Type: multipart/alternative;
 boundary="------------FF8756F676AE5FE6AA7FE5EF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FF8756F676AE5FE6AA7FE5EF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

To whom it may concern

I hope here is the right place to ask about envytools.

I am working on securing our GPUs in the case of an OpenStack
infrastructure, where GPUs can be bound and unbound to VMs from
different clients.

I wanted to use envytools to retrieve the VBIOS our cards, then check
after each VM deletion if somebody changed the VBIOS (potentially a
threat). The VBIOS would be read again and compared to the previously
stored one.

So we would like to know:

  * is the card harmed in any way by reading the BIOS (I guess not, as
    we simply read**);
  * the utility also suggests that the cards have a second VBIOS. Is
    this second VBIOS also read at the same time? If not, how to read it?=

  * the VBIOS file read is larger than the one that could be read using
    the NVFlash utility (1 Mo for envytools, against 230 ko for
    NVFlash). I guess it is not an issue, but could you explain why this
    difference occurs?

Thanks for your help.

Best regards,

Jean Chorin


--------------FF8756F676AE5FE6AA7FE5EF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>To whom it may concern</p>
    <p>I hope here is the right place to ask about envytools.<br>
    </p>
    <p>I am working on securing our GPUs in the case of an OpenStack
      infrastructure, where GPUs can be bound and unbound to VMs from
      different clients.</p>
    <p>I wanted to use envytools to retrieve the VBIOS our cards, then
      check after each VM deletion if somebody changed the VBIOS
      (potentially a threat). The VBIOS would be read again and compared
      to the previously stored one.<br>
    </p>
    <p>So we would like to know:<br>
    </p>
    <ul data-sourcepos="8:1-11:0" dir="auto">
      <li data-sourcepos="8:1-8:127">is the card harmed in any way by
        reading the BIOS (I guess not, as we simply read<strong></strong>);</li>
      <li data-sourcepos="9:1-9:140">the utility also suggests that the
        cards have a second VBIOS. Is this second VBIOS also read at the
        same time? If not, how to read it?<br>
      </li>
      <li data-sourcepos="10:1-11:0">the VBIOS file read is larger than
        the one that could be read using the NVFlash utility (1 Mo for
        envytools, against 230 ko for NVFlash). I guess it is not an
        issue, but could you explain why this difference occurs?</li>
    </ul>
    <p>Thanks for your help.</p>
    <p>Best regards,</p>
    <p>Jean Chorin<br>
    </p>
  </body>
</html>

--------------FF8756F676AE5FE6AA7FE5EF--

--===============1894625767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1894625767==--
