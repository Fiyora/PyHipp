#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

<<<<<<< HEAD
echo
echo "#==========================================================="
echo "Start Times"

# Print only first time.struct_time from each file
for job in rplpl rplspl; do
    for out_file in ${job}-slurm*.out; do
        [[ -f "$out_file" ]] || { echo "No output file found for $job"; continue; }

        echo "==> $out_file <=="
        grep "time.struct_time" "$out_file" | head -n1
        echo
    done
done

echo "End Times"
# Print last time.struct_time, then duration, then MessageId
for job in rplpl rplspl; do
    for out_file in ${job}-slurm*.out; do
        [[ -f "$out_file" ]] || continue

        echo "==> $out_file <=="
        grep "time.struct_time" "$out_file" | tail -n1

        grep -Eo '^[0-9]+\.[0-9]+' "$out_file" | tail -n1
	msgid=$(grep '"MessageId":' "$out_file" | tail -n1)
	echo "{"
	echo "    $msgid"
	echo "}"
    done
done
echo "#==========================================================="

