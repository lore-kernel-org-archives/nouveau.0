From: "Harald Harders" <harald.harders-Mmb7MZpHnFY@public.gmane.org>
Subject: Instable graphics with GeForce GT 730M,
 especially on external monitor
Date: Tue, 18 Jun 2019 21:28:30 +0200
Message-ID: <trinity-60f06d18-ea3c-49a9-8a25-d6aa7f233436-1560886110718@3c-app-gmx-bs22>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0101000947=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============0101000947==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Dear all,</div>

<div>&nbsp;</div>

<div class="signature">I have recently updated my Lenovo T440p with a dual graphics card (Intel Core + GeForce GT 730M) to OpenSUSE Leap 15.1. Since then, the external screen (connected either via VGA, DVI, HDMI, or DisplayPort) has a vertically stretched output which jumps horizontally in high frequency. Whenever touching any settings for the built in display (e.g. by gnome-control-center), also this screen starts incorrect display. Sometimes, however, also the external screen works as expected.</div>

<div class="signature">&nbsp;</div>

<div class="signature">Installed driver version is (only 2D installed):</div>

<div class="signature">xf86-video-nouveau: 1.0.15-lp151.4.1</div>

<div class="signature">libvdpau_nouveau: 18.3.2-lp151.22.4</div>

<div class="signature">libdrm_nouveau2: 2.4.97-lp151.1.1</div>

<div class="signature">&nbsp;</div>

<div class="signature">I have followed your instructions on the TroubleShooting page, No signs for NVIDIA drivers running, everything appears to be okay. Minimal xorg.conf did not work, screenshots are okay.Unfortunately, I failed in installing the most recent nouveau version (neither /lib/modules/4.12.14-lp151.28.4-default/source nor /lib/modules/4.12.14-lp151.28.4-default/build are present on my computer even though I have installed the Kernel sources). The installed version is still quite new, isn&#39;t it?</div>

<div class="signature">&nbsp;</div>

<div class="signature">I suspect that I might have the issue you describe under &quot;Blank monitor, flicker, snow, or other random live image corruption&quot;. I would like to make sure, however. And since you warn with regards to potential permanent damage, I would like to make sure, first.</div>

<div class="signature">Can you confirm that it should be this issue? Or are there any other things I should try first?</div>

<div class="signature">&nbsp;</div>

<div class="signature">Best regards</div>

<div class="signature">Harald</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div>&nbsp;
<div class="signature">
<div>lose:/home/harders/download/nouveau/drm # lspci &#124; grep -i vga<br/>
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)<br/>
02:00.0 VGA compatible controller: NVIDIA Corporation GK208M [GeForce GT 730M] (rev a1)</div>

<div>&nbsp;</div>
</div>
</div></div></body></html>

--===============0101000947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0101000947==--
