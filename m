From: Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>
Subject: Re: Nouveau not working on second monitor
Date: Thu, 28 Feb 2013 09:09:20 +0100
Message-ID: <512F10B0.4000200@nimrod-online.com>
References: <8CFE33A88AEDFDF-6CC-8332E@webmail-d214.sysops.aol.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1500215876=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8CFE33A88AEDFDF-6CC-8332E-n3SY6/QrmYWrbyn9oLO2vrQXJ8qk6zCwQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1500215876==
Content-Type: multipart/alternative;
 boundary="------------010203000502080004030902"

This is a multi-part message in MIME format.
--------------010203000502080004030902
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Your kernel log shows that nouveau isn't loaded. Instead, an old version 
of the closed-source nVidia driver is brought up, possibly when X 
starts. Get rid of it and make sure to remove nouveau from the blacklist.

Op 27-02-13 20:48, rv0987-YDxpq3io04c@public.gmane.org schreef:
> Hi,
>
> I have a problem that my nouveau driver does not properly load every 
> time I boot my laptop.
>
> It either:
> - defaults to the vesa driver (always if my power cord is plugged into 
> the laptop
> - starts nouveau but without the external monitor
> - starts nouveau WITH the external monitor (as it should be)
>
> (starting without the monitor attached and then connecting it always 
> fails & crashes X)
>
> How/where can i find any help for this?
>
> Details:
> - Ubuntu 12.10.
> - card:  VGA compatible controller: NVIDIA Corporation G86 [GeForce 
> 8400M GT] (rev a1)
> - kernel 3.5.0-25-generic
> - X.Org X Server 1.13.0 Release Date: 2012-09-05
> - all nv & nvidia drivers are blacklisted
> - the problem has grown worse over the last 2 years
>
>
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau


--------------010203000502080004030902
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Your kernel log shows that nouveau
      isn't loaded. Instead, an old version of the closed-source nVidia
      driver is brought up, possibly when X starts. Get rid of it and
      make sure to remove nouveau from the blacklist.<br>
      <br>
      Op 27-02-13 20:48, <a class="moz-txt-link-abbreviated" href="mailto:rv0987-YDxpq3io04c@public.gmane.org">rv0987-YDxpq3io04c@public.gmane.org</a> schreef:<br>
    </div>
    <blockquote
      cite="mid:8CFE33A88AEDFDF-6CC-8332E-n3SY6/QrmYWrbyn9oLO2vrQXJ8qk6zCwQQ4Iyu8u01E@public.gmane.org"
      type="cite"><font color="black" face="arial" size="2"><font
          size="2">Hi,<br>
          <br>
          <font size="2"><font size="2"><font size="2">I have a problem
                that my nouveau driver does not properly load every time
                I boot my laptop.<br>
                <br>
                <font size="2">It either:<br>
                  <font size="2">- </font>defaults to the vesa driver
                  (always if my power cord is plugged into the laptop<br>
                  <font size="2">- <font size="2">starts nouveau but
                      with<font size="2">o<font size="2">ut the external
                          monitor<br>
                          <font size="2">- starts nouveau WITH the
                            external monitor (as it should be)</font><br>
                          <br>
                          <font size="2">(starting without the monitor
                            attached and then connecting it always fails
                            &amp; cr<font size="2">ashes X<font size="2">)<br>
                                <br>
                                <font size="2">How/w<font size="2">here
                                    can i find any h<font size="2">el</font>p
                                    for this?</font></font><br>
                                <br>
                                <font size="2">De<font size="2">tails:<br>
                                    <font size="2">- </font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font><font
        size="2"><font size="2"><font size="2"><font size="2"><font
                size="2"><font size="2"><font size="2"><font size="2"><font
                        size="2"><font size="2"><font size="2"><font
                              size="2"><font size="2"><font size="2"><font
                                    size="2"><font size="2"><font
                                        size="2">Ubun<font size="2">tu
                                          12.10.</font></font></font></font><br>
                                  <font size="2">- card:&nbsp; VGA compatible
                                    controller: NVIDIA Corporation G86
                                    [GeForce 8400M GT] (rev a1)<br>
                                    <font size="2">- kernel
                                      3.5.0-25-generic<br>
                                      <font size="2">- X.Org X Server
                                        1.13.0 Release Date: 2012-09-05</font><br>
                                      <font size="2">- all nv &amp;
                                        nvidia drivers are <font
                                          size="2">blacklisted<br>
                                          <font size="2">- the problem
                                            has grown worse over the
                                            last 2 years</font><br>
                                          <br>
                                          <br>
                                        </font></font></font></font></font></font><br>
                            </font></font></font></font></font></font></font></font></font></font></font></font><font
        color="black" face="arial" size="2">
      </font>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Nouveau mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="http://lists.freedesktop.org/mailman/listinfo/nouveau">http://lists.freedesktop.org/mailman/listinfo/nouveau</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010203000502080004030902--

--===============1500215876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1500215876==--
