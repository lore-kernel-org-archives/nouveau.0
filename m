From: Lijo Antony <lijo.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: HDMI support for NVC1 (GeForce GT 540M)
Date: Sun, 24 Feb 2013 21:50:30 +0400
Message-ID: <512A52E6.6050505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi,

I have been using nouveau on my laptop (with GeForce GT 540M card) for a 
while, and it's been working quite well! Now I am trying to connect my 
TV using HDMI port, but wasn't so lucky with that. I would like to know 
the current status of HDMI out support for GF108 (NVC1). I am trying 
with the latest code from nouveau/master tree (2fee6f5).

When I connect the tv, it's not getting detected by the laptop. I see a 
small change in brightness of the laptop screen for a moment and nothing 
else. Usually there is nothing in the dmesg as well, but once I saw the 
below line.

[  249.780634] nouveau E[   PDISP][0000:01:00.0] chid 1 mthd 0x0080 data 
0x00000000 0x000b5080

But when I removed the HDMI cable, I got the below log.

[  290.216947] [drm:drm_edid_block_valid] *ERROR* EDID checksum is 
invalid, remainder is 130
[  290.216958] Raw EDID:
[  290.216964]  	00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[  290.216968]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  290.216972]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  290.216976]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  290.216981]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  290.216985]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  290.216989]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  290.216993]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  290.218145] nouveau E[     DRM] DDC responded, but no EDID for HDMI-A-1

I tried several times, each time with similar logs when the cable is 
plugged out.

[  374.467404] [drm:drm_edid_block_valid] *ERROR* EDID checksum is 
invalid, remainder is 130
[  374.467414] Raw EDID:
[  374.467420]  	00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[  374.467425]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  374.467429]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  374.467433]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  374.467437]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  374.467441]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  374.467445]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  374.467449]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  374.468604] nouveau E[     DRM] DDC responded, but no EDID for HDMI-A-1

------------------------

[  171.633395] [drm:drm_edid_block_valid] *ERROR* EDID checksum is 
invalid, remainder is 244
[  171.633407] Raw EDID:
[  171.633413]  	00 ff ff ff ff ff ff 00 1e 6d 01 00 01 01 01 01
[  171.633417]  	01 14 01 03 80 a0 5a 78 0a d9 b0 a3 57 49 9c 25
[  171.633421]  	11 49 4b 20 00 00 01 01 01 01 01 01 01 01 01 01
[  171.633425]  	01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 6e 28
[  171.633429]  	55 00 c4 8e 21 00 00 1e 8c 0a d0 8a 20 e0 2d 10
[  171.633433]  	10 3e 96 00 13 8e ff ff ff ff ff ff ff ff ff ff
[  171.633437]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  171.633441]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  171.634517] nouveau E[     DRM] DDC responded, but no EDID for HDMI-A-1

----------------

[  229.771970] [drm:drm_edid_block_valid] *ERROR* EDID checksum is 
invalid, remainder is 201
[  229.771981] Raw EDID:
[  229.771988]  	00 ff ff ff ff ff ff 00 1e 6d 01 00 01 01 01 01
[  229.771992]  	01 14 01 03 80 a0 5a 78 0a d9 b0 a3 57 49 bf ff
[  229.771996]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  229.772000]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  229.772004]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  229.772008]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  229.772012]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  229.772016]  	ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  229.773103] nouveau E[     DRM] DDC responded, but no EDID for HDMI-A-1


I am trying to figure out from code, but any help would be greatly 
appreciated! I can post the full logs or .config file if required.

Thanks in advance,
-lijo
