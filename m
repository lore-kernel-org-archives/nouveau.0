From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: [PATCH] mesa: nouveau/nvfx primitive restart
Date: Sat, 13 Nov 2010 12:40:38 +0100
Message-ID: <4CDE7936.6040309@student.tuwien.ac.at>
References: <20101113112006.e161abe1.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1491871359=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101113112006.e161abe1.mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1491871359==
Content-Type: multipart/alternative;
 boundary="------------010701050105010905070600"

This is a multi-part message in MIME format.
--------------010701050105010905070600
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 13.11.2010 11:20, Patrice Mandin wrote:
> Hello,
>
> As nv30/nv40 supports primitive restart in hardware, here is a patch.
>
Thank you, note however that this does not make it work yet in the case
where the driver decides to push vertex data on the FIFO directly, which
is implemented via the translate module and u_split_prim in nvfx_push.c,
maybe you could adjust that path too ?

Cheers,
Christoph
> I still did not manage to get piglit working to check for correctness,
> so I would like to know if it's ok as is.
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau


--------------010701050105010905070600
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#ffffff" text="#000000">
    On 13.11.2010 11:20, Patrice Mandin wrote:
    <blockquote
      cite="mid:20101113112006.e161abe1.mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org"
      type="cite">
      <pre wrap="">Hello,

As nv30/nv40 supports primitive restart in hardware, here is a patch.

</pre>
    </blockquote>
    Thank you, note however that this does not make it work yet in the
    case where the driver decides to push vertex data on the FIFO
    directly, which is implemented via the translate module and
    u_split_prim in nvfx_push.c, maybe you could adjust that path too ?<br>
    <br>
    Cheers,<br>
    Christoph<br>
    <blockquote
      cite="mid:20101113112006.e161abe1.mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org"
      type="cite">
      <pre wrap="">I still did not manage to get piglit working to check for correctness,
so I would like to know if it's ok as is.

</pre>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Nouveau mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="http://lists.freedesktop.org/mailman/listinfo/nouveau">http://lists.freedesktop.org/mailman/listinfo/nouveau</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010701050105010905070600--

--===============1491871359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1491871359==--
